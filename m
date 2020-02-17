Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 50F9A161343
	for <lists+dm-devel@lfdr.de>; Mon, 17 Feb 2020 14:26:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581945989;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6po7+Z1RzP7A/oRyV09PriwOGIk9jEO71uo2SvG3Pkc=;
	b=Sf66BZtmEiXIweAd1SJIc4TuE87qgS1qpKpyiOrPH83vS+YRGS1hmD3sj7kgaSjfgBl1ZE
	jpvdor2eCbk7hyx1yMU8rLhK9dwz7GWP20u/NGQk8IaGOugzmO5h7Y4W0AF6hJesaNYKvn
	2WiO7qCewwv31csbCMkgyTGv7a2HGow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-8Lpx1LbmPdicyavv8JMYHw-1; Mon, 17 Feb 2020 08:26:26 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC14E107ACC5;
	Mon, 17 Feb 2020 13:26:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 868DC19757;
	Mon, 17 Feb 2020 13:26:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1075435AE1;
	Mon, 17 Feb 2020 13:26:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HDQEEu004285 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 08:26:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8A6A02166B2A; Mon, 17 Feb 2020 13:26:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86A992166B27
	for <dm-devel@redhat.com>; Mon, 17 Feb 2020 13:26:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1762180192D
	for <dm-devel@redhat.com>; Mon, 17 Feb 2020 13:26:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-419-DvX1sOAeNbKsfGGy9V8DHA-1; Mon, 17 Feb 2020 08:26:09 -0500
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j3gPX-0004Yx-6K; Mon, 17 Feb 2020 13:26:07 +0000
Date: Mon, 17 Feb 2020 05:26:07 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Vivek Goyal <vgoyal@redhat.com>
Message-ID: <20200217132607.GD14490@infradead.org>
References: <20200207202652.1439-1-vgoyal@redhat.com>
	<20200207202652.1439-4-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200207202652.1439-4-vgoyal@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: DvX1sOAeNbKsfGGy9V8DHA-1
X-MC-Unique: 8Lpx1LbmPdicyavv8JMYHw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01HDQEEu004285
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm@lists.01.org, vishal.l.verma@intel.com, hch@infradead.org,
	dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	dan.j.williams@intel.com
Subject: Re: [dm-devel] [PATCH v3 3/7] dax,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> +	int rc;
> +	struct pmem_device *pmem = dax_get_private(dax_dev);
> +	struct page *page = ZERO_PAGE(0);

Nit: I tend to find code easier to read if variable declarations
with assignments are above those without.

Also I don't think we need the page variable here.

> +	rc = pmem_do_write(pmem, page, 0, offset, len);
> +	if (rc > 0)
> +		return -EIO;

pmem_do_write returns a blk_status_t, so the type of rc and the > check
seem odd.  But I think pmem_do_write (and pmem_do_read) might be better
off returning a normal errno anyway.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

