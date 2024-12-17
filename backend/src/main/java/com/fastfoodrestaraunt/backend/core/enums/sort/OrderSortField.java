package com.fastfoodrestaraunt.backend.core.enums.sort;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum OrderSortField {
    ID("id"),
    CREATED_AT("createdAt"),
    COMPLETED_AT("completedAt"),
    STATUS("status");

    private final String value;
}
