Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E00D116137E
	for <lists+dm-devel@lfdr.de>; Mon, 17 Feb 2020 14:31:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581946278;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nrscfRLWEwUG5b8YfxWvi1d5OhLcR5ft8NEWcqMBEfQ=;
	b=I2ZPQpvSOs/B3xonidvLHvOIHAMBhXOHBArSGK/z/RC2OYXZUmHSaV7ZOL5oa7N7QcrWA6
	AuxaGKWSeghuumXDEzGGGsVLm5RlOATSTCrKcilm50GtyHKI48U1HZS6YKzSy5uURXLUQQ
	vxQ+gJHU/WuSzS0dx3erH8V4v6qbGWU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-v1FxkJ2QN4C7wp1fp8LfMw-1; Mon, 17 Feb 2020 08:31:16 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98D6C18A6EDD;
	Mon, 17 Feb 2020 13:31:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64FB760BEC;
	Mon, 17 Feb 2020 13:31:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 56A5338A1;
	Mon, 17 Feb 2020 13:31:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HDV4iD004605 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 08:31:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ED2242166B2D; Mon, 17 Feb 2020 13:31:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1E112166B2A
	for <dm-devel@redhat.com>; Mon, 17 Feb 2020 13:31:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5734580100E
	for <dm-devel@redhat.com>; Mon, 17 Feb 2020 13:31:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-3-Da5s7cWSNBWqUONY3oeJIg-1; Mon, 17 Feb 2020 08:30:57 -0500
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j3gLC-0002Jr-K2; Mon, 17 Feb 2020 13:21:38 +0000
Date: Mon, 17 Feb 2020 05:21:38 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Vivek Goyal <vgoyal@redhat.com>
Message-ID: <20200217132138.GB14490@infradead.org>
References: <20200207202652.1439-1-vgoyal@redhat.com>
	<20200207202652.1439-2-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200207202652.1439-2-vgoyal@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: Da5s7cWSNBWqUONY3oeJIg-1
X-MC-Unique: v1FxkJ2QN4C7wp1fp8LfMw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01HDV4iD004605
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm@lists.01.org, vishal.l.verma@intel.com, hch@infradead.org,
	dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	dan.j.williams@intel.com
Subject: Re: [dm-devel] [PATCH v3 1/7] pmem: Add functions for
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Feb 07, 2020 at 03:26:46PM -0500, Vivek Goyal wrote:
> +static blk_status_t pmem_do_bvec(struct pmem_device *pmem, struct page *page,
> +			unsigned int len, unsigned int off, unsigned int op,
> +			sector_t sector)
> +{
> +	if (!op_is_write(op))
> +		return pmem_do_read(pmem, page, off, sector, len);
> +
> +	return pmem_do_write(pmem, page, off, sector, len);

Why not:

	if (op_is_write(op))
		return pmem_do_write(pmem, page, off, sector, len);
	return pmem_do_read(pmem, page, off, sector, len);

that being said I don't see the point of this pmem_do_bvec helper given
that it only has two callers.

The rest looks good to me.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

