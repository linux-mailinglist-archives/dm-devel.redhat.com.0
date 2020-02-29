Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D29AC1757B1
	for <lists+dm-devel@lfdr.de>; Mon,  2 Mar 2020 10:53:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583142800;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ONlD2UBg3rqzDnCf4oTN73fpviUZe2GgjJW5fKPbcr8=;
	b=eHUbMZL2hm+AX/7qb5C5QUr/xgQnvRQRNOndZ0GJur4hMRu2csNFM3riJK0WNPYUHPT4xW
	R/LQL2hBqIYUA7WqznlWQvVbTIS7XEkxAaCvlu8PgeWtBGrF/Thh54D0ZdeA2b6HJJrXY5
	oeA8zq+o/84zlo4ImzBi5rIzWL3T55I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-MiBKFDhLPTOZmuGrrnxYtw-1; Mon, 02 Mar 2020 04:53:18 -0500
X-MC-Unique: MiBKFDhLPTOZmuGrrnxYtw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C0A913F7;
	Mon,  2 Mar 2020 09:53:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA4C08B57B;
	Mon,  2 Mar 2020 09:53:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA15B18089CF;
	Mon,  2 Mar 2020 09:53:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01T84JiC021529 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 29 Feb 2020 03:04:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2BE912166B2D; Sat, 29 Feb 2020 08:04:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 276212166B2B
	for <dm-devel@redhat.com>; Sat, 29 Feb 2020 08:04:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7FF9811AAE
	for <dm-devel@redhat.com>; Sat, 29 Feb 2020 08:04:16 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-114-ybN5nOF4PYSkOqiGGjPTtw-1; Sat, 29 Feb 2020 03:04:14 -0500
X-MC-Unique: ybN5nOF4PYSkOqiGGjPTtw-1
Received: by mail-wm1-f66.google.com with SMTP id i10so9862602wmd.1;
	Sat, 29 Feb 2020 00:04:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5uuuwXmEYzKMQWHoj3FlOv3W0FcMz6JiZ2HkvpHOxlY=;
	b=pmYNvW1T4NPnNAmca8djPmD/AYfClShzWaEQ7Hq8qxgv2ZVBOTZff9Hlb1GYY9CTPx
	Lm+/vmKYAceNfd024QjsXS9HCAZb/CLvj1LXpbieuQaBbts3sRkUFKYBD1WTbHNNv4qK
	bPEq23fsEBAjRyrBB1ysF/7SS/hwFJ8OB6MQpcY7JwglElRHIhvcILVX6QCMMNktPaOZ
	MGIjGZombLvrfbk6wcffNPHTh5wJ1081ly+UKuhf3ZxncL0AZd27UIpK1LignVjPw48G
	rDjAotOOf0UCLddC4Z4AocDGbn92DgbkY1tWPgKXp/qqfAcmX6efH/r2w88DvEgGrFtT
	0mXQ==
X-Gm-Message-State: APjAAAWUTkpZPzMxeBlQJI3CubSlY/P+4eDxPo0lbDQW1kMC+atSlgBN
	/SC5UaUfHTbNTph5zV4w310XckXp1x/K4XJCDHPp3srCSbw=
X-Google-Smtp-Source: APXvYqx0csBzSURuS/yibvzs0QZc0eFRxP0mymsBxYXXWF0i4h66voqBNGDpRg+MOvg+NnwvY7slgvvjgmbCqiyqQpQ=
X-Received: by 2002:a1c:9c52:: with SMTP id f79mr9014466wme.30.1582963452149; 
	Sat, 29 Feb 2020 00:04:12 -0800 (PST)
MIME-Version: 1.0
References: <20200228163456.1587-1-vgoyal@redhat.com>
	<20200228163456.1587-2-vgoyal@redhat.com>
In-Reply-To: <20200228163456.1587-2-vgoyal@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Sat, 29 Feb 2020 09:04:00 +0100
Message-ID: <CAM9Jb+gJWH_bC-9fgGdeP5LaSVjJ3JgTnjBxpRJMfe6vbTPOTA@mail.gmail.com>
To: Vivek Goyal <vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01T84JiC021529
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 02 Mar 2020 04:53:00 -0500
Cc: linux-nvdimm@lists.01.org, david@fromorbit.com, hch@infradead.org,
	dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	dan.j.williams@intel.com, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH v6 1/6] pmem: Add functions for
 reading/writing page to/from pmem
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 28 Feb 2020 at 17:35, Vivek Goyal <vgoyal@redhat.com> wrote:
>
> This splits pmem_do_bvec() into pmem_do_read() and pmem_do_write().
> pmem_do_write() will be used by pmem zero_page_range() as well. Hence
> sharing the same code.
>
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  drivers/nvdimm/pmem.c | 86 +++++++++++++++++++++++++------------------
>  1 file changed, 50 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> index 4eae441f86c9..075b11682192 100644
> --- a/drivers/nvdimm/pmem.c
> +++ b/drivers/nvdimm/pmem.c
> @@ -136,9 +136,25 @@ static blk_status_t read_pmem(struct page *page, unsigned int off,
>         return BLK_STS_OK;
>  }
>
> -static blk_status_t pmem_do_bvec(struct pmem_device *pmem, struct page *page,
> -                       unsigned int len, unsigned int off, unsigned int op,
> -                       sector_t sector)
> +static blk_status_t pmem_do_read(struct pmem_device *pmem,
> +                       struct page *page, unsigned int page_off,
> +                       sector_t sector, unsigned int len)
> +{
> +       blk_status_t rc;
> +       phys_addr_t pmem_off = sector * 512 + pmem->data_offset;

minor nit,  maybe 512 is replaced by macro? Looks like its used at multiple
places, maybe can keep at is for now.

> +       void *pmem_addr = pmem->virt_addr + pmem_off;
> +
> +       if (unlikely(is_bad_pmem(&pmem->bb, sector, len)))
> +               return BLK_STS_IOERR;
> +
> +       rc = read_pmem(page, page_off, pmem_addr, len);
> +       flush_dcache_page(page);
> +       return rc;
> +}
> +
> +static blk_status_t pmem_do_write(struct pmem_device *pmem,
> +                       struct page *page, unsigned int page_off,
> +                       sector_t sector, unsigned int len)
>  {
>         blk_status_t rc = BLK_STS_OK;
>         bool bad_pmem = false;
> @@ -148,34 +164,25 @@ static blk_status_t pmem_do_bvec(struct pmem_device *pmem, struct page *page,
>         if (unlikely(is_bad_pmem(&pmem->bb, sector, len)))
>                 bad_pmem = true;
>
> -       if (!op_is_write(op)) {
> -               if (unlikely(bad_pmem))
> -                       rc = BLK_STS_IOERR;
> -               else {
> -                       rc = read_pmem(page, off, pmem_addr, len);
> -                       flush_dcache_page(page);
> -               }
> -       } else {
> -               /*
> -                * Note that we write the data both before and after
> -                * clearing poison.  The write before clear poison
> -                * handles situations where the latest written data is
> -                * preserved and the clear poison operation simply marks
> -                * the address range as valid without changing the data.
> -                * In this case application software can assume that an
> -                * interrupted write will either return the new good
> -                * data or an error.
> -                *
> -                * However, if pmem_clear_poison() leaves the data in an
> -                * indeterminate state we need to perform the write
> -                * after clear poison.
> -                */
> -               flush_dcache_page(page);
> -               write_pmem(pmem_addr, page, off, len);
> -               if (unlikely(bad_pmem)) {
> -                       rc = pmem_clear_poison(pmem, pmem_off, len);
> -                       write_pmem(pmem_addr, page, off, len);
> -               }
> +       /*
> +        * Note that we write the data both before and after
> +        * clearing poison.  The write before clear poison
> +        * handles situations where the latest written data is
> +        * preserved and the clear poison operation simply marks
> +        * the address range as valid without changing the data.
> +        * In this case application software can assume that an
> +        * interrupted write will either return the new good
> +        * data or an error.
> +        *
> +        * However, if pmem_clear_poison() leaves the data in an
> +        * indeterminate state we need to perform the write
> +        * after clear poison.
> +        */
> +       flush_dcache_page(page);
> +       write_pmem(pmem_addr, page, page_off, len);
> +       if (unlikely(bad_pmem)) {
> +               rc = pmem_clear_poison(pmem, pmem_off, len);
> +               write_pmem(pmem_addr, page, page_off, len);
>         }
>
>         return rc;
> @@ -197,8 +204,12 @@ static blk_qc_t pmem_make_request(struct request_queue *q, struct bio *bio)
>
>         do_acct = nd_iostat_start(bio, &start);
>         bio_for_each_segment(bvec, bio, iter) {
> -               rc = pmem_do_bvec(pmem, bvec.bv_page, bvec.bv_len,
> -                               bvec.bv_offset, bio_op(bio), iter.bi_sector);
> +               if (op_is_write(bio_op(bio)))
> +                       rc = pmem_do_write(pmem, bvec.bv_page, bvec.bv_offset,
> +                               iter.bi_sector, bvec.bv_len);
> +               else
> +                       rc = pmem_do_read(pmem, bvec.bv_page, bvec.bv_offset,
> +                               iter.bi_sector, bvec.bv_len);
>                 if (rc) {
>                         bio->bi_status = rc;
>                         break;
> @@ -223,9 +234,12 @@ static int pmem_rw_page(struct block_device *bdev, sector_t sector,
>         struct pmem_device *pmem = bdev->bd_queue->queuedata;
>         blk_status_t rc;
>
> -       rc = pmem_do_bvec(pmem, page, hpage_nr_pages(page) * PAGE_SIZE,
> -                         0, op, sector);
> -
> +       if (op_is_write(op))
> +               rc = pmem_do_write(pmem, page, 0, sector,
> +                                  hpage_nr_pages(page) * PAGE_SIZE);
> +       else
> +               rc = pmem_do_read(pmem, page, 0, sector,
> +                                  hpage_nr_pages(page) * PAGE_SIZE);
>         /*
>          * The ->rw_page interface is subtle and tricky.  The core
>          * retries on any error, so we can only invoke page_endio() in
> --
> 2.20.1

Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> _______________________________________________
> Linux-nvdimm mailing list -- linux-nvdimm@lists.01.org
> To unsubscribe send an email to linux-nvdimm-leave@lists.01.org


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

