Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E79D22ED721
	for <lists+dm-devel@lfdr.de>; Thu,  7 Jan 2021 20:05:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610046309;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4HtYw1TkovG+pK6OUKZ/zp54czZZlm+D/sq9G3jh0LE=;
	b=Mcex8WimwROpY+kFcRe/H669O7pa96Iq+3lFzmW7UPScbN9oJGk+SF20b6b3zVD+DdZbfA
	WL8tuGKK4+GIxJR0oi5q54gK6J+DnzZ4jMsr96duoguKlh4QZw0hUDGZcztD1XJQjJMH+E
	5un8ul8LAQSGM8Bgf+F+MhpCebhOJDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-lBAzz0w_M4GTK15H0fRpeg-1; Thu, 07 Jan 2021 14:05:05 -0500
X-MC-Unique: lBAzz0w_M4GTK15H0fRpeg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D262107ACE4;
	Thu,  7 Jan 2021 19:04:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A718610023AC;
	Thu,  7 Jan 2021 19:04:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 512D34E58E;
	Thu,  7 Jan 2021 19:04:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 107J4T5A004454 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 Jan 2021 14:04:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F2CFD5D705; Thu,  7 Jan 2021 19:04:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5CF26268F;
	Thu,  7 Jan 2021 19:04:25 +0000 (UTC)
Date: Thu, 7 Jan 2021 14:04:24 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <20210107190424.GA21239@redhat.com>
References: <20201223112624.78955-1-jefflexu@linux.alibaba.com>
	<20201223112624.78955-2-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20201223112624.78955-2-jefflexu@linux.alibaba.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com, io-uring@vger.kernel.org
Subject: Re: [dm-devel] [PATCH RFC 1/7] block: move definition of blk_qc_t
	to types.h
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 23 2020 at  6:26am -0500,
Jeffle Xu <jefflexu@linux.alibaba.com> wrote:

> So that kiocb.ki_cookie can be defined as blk_qc_t, which will enforce
> the encapsulation.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---
>  include/linux/blk_types.h | 2 +-
>  include/linux/fs.h        | 2 +-
>  include/linux/types.h     | 3 +++
>  3 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> index 866f74261b3b..2e05244fc16d 100644
> --- a/include/linux/blk_types.h
> +++ b/include/linux/blk_types.h
> @@ -532,7 +532,7 @@ static inline int op_stat_group(unsigned int op)
>  	return op_is_write(op);
>  }
>  
> -typedef unsigned int blk_qc_t;
> +/* Macros for blk_qc_t */
>  #define BLK_QC_T_NONE		-1U
>  #define BLK_QC_T_SHIFT		16
>  #define BLK_QC_T_INTERNAL	(1U << 31)
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index ad4cf1bae586..58db714c4834 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -330,7 +330,7 @@ struct kiocb {
>  	u16			ki_hint;
>  	u16			ki_ioprio; /* See linux/ioprio.h */
>  	union {
> -		unsigned int		ki_cookie; /* for ->iopoll */
> +		blk_qc_t		ki_cookie; /* for ->iopoll */
>  		struct wait_page_queue	*ki_waitq; /* for async buffered IO */
>  	};
>  
> diff --git a/include/linux/types.h b/include/linux/types.h
> index a147977602b5..da5ca7e1bea9 100644
> --- a/include/linux/types.h
> +++ b/include/linux/types.h
> @@ -125,6 +125,9 @@ typedef s64			int64_t;
>  typedef u64 sector_t;
>  typedef u64 blkcnt_t;
>  
> +/* cookie used for IO polling */
> +typedef unsigned int blk_qc_t;
> +
>  /*
>   * The type of an index into the pagecache.
>   */
> -- 
> 2.27.0
> 

Unfortunate that you cannot just include blk_types.h in fs.h; but
vma_is_dax() ruins that for us since commit baabda2614245 ("mm: always
enable thp for dax mappings").

Reviewed-by: Mike Snitzer <snitzer@redhat.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

