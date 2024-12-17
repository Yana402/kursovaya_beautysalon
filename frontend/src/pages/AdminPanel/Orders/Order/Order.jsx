import React from "react";
import styles from "./index.module.css";
import OrderItem from "./OrderItem/OrderItem";
import InputSelect from "../../../../components/Inputs/InputSelect/InputSelect";
import PhoneIcon from "./icons/phone.svg";

function Order({ order, statuses, onStatusChange }) {
  const { id, userPhone, deliveryAddress, status, createdAt, completedAt, items } = order;

  const handleStatusChange = (newSelectedStatus) => {
    onStatusChange(id, newSelectedStatus);
  };

  return (
    <div className={styles.order}>
      <p className={styles.order__id}>Order №{id}</p>
      <div className={styles.contactContainer}>
        <img
          src={PhoneIcon}
          className={styles.contactContainer__icon}
          alt="icon"
        />
        <a href={`callto:${userPhone}`}>{userPhone}</a>
      </div>
      <p className={styles.order__creationTime}>
        Created at {formatDate(createdAt)}
      </p>
      <div className={styles.statusContainer}>
      <InputSelect
        label="Status"
        options={statuses}
        value={status}
        name="order status"
        onChange={handleStatusChange}
      />
      {status === "DELIVERED" && completedAt && (
        <p className={styles.order__completeTime}>
          &nbsp;at {formatDate(completedAt)}
        </p>
      )}
      </div>
      <ul className={styles.order__items}>
        {items.map((item) => (
          <OrderItem key={item.product.id} item={item} />
        ))}
      </ul>
      <div className={styles.totalContainer}>
        <p className={styles.totalContainer__caption}>Total:</p>
        <p className={styles.totalContainer__price}>
          ${calculateTotalPrice(items)}
        </p>
        <p className={styles.totalContainer__quantity}>
          {calculateTotalQuantity(items)} pc.
        </p>
      </div>
    </div>
  );
}

function calculateTotalQuantity(items) {
  let totalQuantity = 0;

  if (Array.isArray(items)) {
    items.forEach((item) => {
      if (item.quantity) {
        totalQuantity += item.quantity;
      }
    });
  }

  return totalQuantity;
}

function calculateTotalPrice(items) {
  let totalPrice = 0;

  if (Array.isArray(items)) {
    items.forEach((item) => {
      if (item.relevantPrice && item.quantity) {
        totalPrice += item.relevantPrice * item.quantity;
      }
    });
  }

  return totalPrice.toFixed(2);
}

function formatDate(date) {
  const options = {
    year: "numeric",
    month: "short",
    day: "numeric",
    hour: "2-digit",
    minute: "2-digit",
  };
  return new Date(date).toLocaleDateString("en-US", options);
}

function getStyleForOrderStatus(status) {
  const styleMap = {
    NEW: styles["order__status--new"],
    PROCESSING: styles["order__status--processing"],
    WAITING: styles["order__status--waiting"],
    COMPLETED: styles["order__status--completed"],
    CANCELLED: styles["order__status--cancelled"],
  };
  return styleMap[status];
}

export default Order;
