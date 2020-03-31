Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB36199F52
	for <lists+dm-devel@lfdr.de>; Tue, 31 Mar 2020 21:42:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585683745;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dHYXDLC2ApdEzekIwjJlF0R9AyrPQzaQN50h5V8yevs=;
	b=GxE0vjpgQmPcQhJm65lB4pZRolD7i+821p4ldTAbyBtQRHPt3zlnh/mBqMcAnf+PJw8Ikv
	s+BpFADJ4i6YvElGtsSR7M+j84x/QTS+atxqYxR49pLJrADnxyEzcO+gKupsRkQrjcWOoq
	NhdzPVldTqHEw4sqIaAsjWUcuUzQMv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-536gHI35P3aUXYHamyMuwA-1; Tue, 31 Mar 2020 15:42:23 -0400
X-MC-Unique: 536gHI35P3aUXYHamyMuwA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DC821084424;
	Tue, 31 Mar 2020 19:42:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 206145D9E2;
	Tue, 31 Mar 2020 19:42:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2410986C0E;
	Tue, 31 Mar 2020 19:42:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02VJcYG7002727 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 31 Mar 2020 15:38:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2DED11003343; Tue, 31 Mar 2020 19:38:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A4D51003332
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 19:38:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEC44101A55F
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 19:38:31 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-480-YHNmpMinPsqOEaPWMN4F9w-1; Tue, 31 Mar 2020 15:38:29 -0400
X-MC-Unique: YHNmpMinPsqOEaPWMN4F9w-1
Received: by mail-ed1-f65.google.com with SMTP id e5so26644046edq.5
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 12:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=coOdi1Ly5bJ5CvWdmQt/Q+ZCp+crvRqi7slIvYScR14=;
	b=Jf5l+OebrBDI5JquZY0k5W8Y/qYoc3ZQ5bpKJ/JYOy0KLNdNXfARzpT+okDPw0/Ao+
	KvnG5Ugq9DAIsvaYI/EOLjTjfvtQ5ZAY9iKD8ClU4az574mhpgAfwWuF8FFSX5GCzBlc
	VZd+BCi8fBph3VjJs2bhphQSDNi8HZ50JImchfQ1eolxo5IfUsE1lbxZMD+zk0bI7odz
	0SoB4F3a/cJM1NDBfJFLoro/tWFus9xvx6NtIbivyQ70YPWjCKxdQ2OhmoJMyqWFRJ4J
	hR76mteuLsF3+PRDZaJKqXGeE4uHbza7G2kmBGdSvgSa31g740HiGtyel/Sepf2zhpV8
	bVoQ==
X-Gm-Message-State: ANhLgQ3tLcON94BO1Fe49hZ0d6GIkMnlI+7ZDYpBHLmZzPmbkdR8RbiE
	tV7GQmN7B3hcHKDJnoksNmMMDMir9U0yBJKhbmondg==
X-Google-Smtp-Source: ADFU+vucdPRa5GwsLNOLq17qDztrUIi3xXzSpp62uKGM5//eINqDk4GDVcCHXXgstr7+YAE0SAGtA+/4ZqZsNN24uMY=
X-Received: by 2002:aa7:d7c7:: with SMTP id e7mr17322078eds.296.1585683508013; 
	Tue, 31 Mar 2020 12:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200218214841.10076-1-vgoyal@redhat.com>
	<20200218214841.10076-5-vgoyal@redhat.com>
In-Reply-To: <20200218214841.10076-5-vgoyal@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 31 Mar 2020 12:38:16 -0700
Message-ID: <CAPcyv4jKHxy5c8BZodePeCu5+Z=cwhtEfw3RnOD1ZDNob382bQ@mail.gmail.com>
To: Vivek Goyal <vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02VJcYG7002727
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>,
	Vishal L Verma <vishal.l.verma@intel.com>,
	Christoph Hellwig <hch@infradead.org>,
	device-mapper development <dm-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH v5 4/8] dax,
	pmem: Add a dax operation zero_page_range
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 18, 2020 at 1:49 PM Vivek Goyal <vgoyal@redhat.com> wrote:
>
> Add a dax operation zero_page_range, to zero a range of memory. This will
> also clear any poison in the range being zeroed.
>
> As of now, zeroing of up to one page is allowed in a single call. There
> are no callers which are trying to zero more than a page in a single call.
> Once we grow the callers which zero more than a page in single call, we
> can add that support. Primary reason for not doing that yet is that this
> will add little complexity in dm implementation where a range might be
> spanning multiple underlying targets and one will have to split the range
> into multiple sub ranges and call zero_page_range() on individual targets.
>
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  drivers/dax/super.c   | 19 +++++++++++++++++++
>  drivers/nvdimm/pmem.c | 10 ++++++++++
>  include/linux/dax.h   |  3 +++
>  3 files changed, 32 insertions(+)
>
> diff --git a/drivers/dax/super.c b/drivers/dax/super.c
> index 0aa4b6bc5101..c912808bc886 100644
> --- a/drivers/dax/super.c
> +++ b/drivers/dax/super.c
> @@ -344,6 +344,25 @@ size_t dax_copy_to_iter(struct dax_device *dax_dev, pgoff_t pgoff, void *addr,
>  }
>  EXPORT_SYMBOL_GPL(dax_copy_to_iter);
>
> +int dax_zero_page_range(struct dax_device *dax_dev, u64 offset, size_t len)
> +{
> +       if (!dax_alive(dax_dev))
> +               return -ENXIO;
> +
> +       if (!dax_dev->ops->zero_page_range)
> +               return -EOPNOTSUPP;

This seems too late to be doing the validation. It would be odd for
random filesystem operations to see this error. I would move the check
to alloc_dax() and fail that if the caller fails to implement the
operation.

An incremental patch on top to fix this up would be ok. Something like
"Now that all dax_operations providers implement zero_page_range()
mandate it at alloc_dax time".


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

