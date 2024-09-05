package org.threefour.homelearn.cart.domain;

import lombok.Getter;

@Getter
public class PagingCount {
    private int totalCount;
    private int pageCount;

    private PagingCount(int totalCount, int pageCount) {
        this.totalCount = totalCount;
        this.pageCount = pageCount;
    }

    public static PagingCount from(int totalCount, int pageCount) {
        return new PagingCount(totalCount, pageCount);
    }
}
