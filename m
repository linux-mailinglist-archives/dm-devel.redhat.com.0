Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 426FD162B9F
	for <lists+dm-devel@lfdr.de>; Tue, 18 Feb 2020 18:10:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582045836;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hm8LkFSSHOQ6B5djrxdcXri7DKP+iTmjLwlT1kSz88M=;
	b=F3Oawx9qisdMHPd/zzyNr9Jsq3dJomu+1ATOEpULUwdOPb8STWGvP3DdJ6Cpo8jpZf/pgb
	3TwCenagayuPg9S0QD7dCOIhbCxEEWzXUQKiTggiBSJqwK5yrq7ABzIIaEliBMt/28nYHV
	VhVnGlc3S8qBbEbvQNbAwIla6VlO6ew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-3q8cN10bOymx_vdLEfMTZw-1; Tue, 18 Feb 2020 12:10:33 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 982BB13EA;
	Tue, 18 Feb 2020 17:10:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2887C19757;
	Tue, 18 Feb 2020 17:10:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E3B9F18089CE;
	Tue, 18 Feb 2020 17:10:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01IHAGUm003757 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 12:10:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E21D12166B2C; Tue, 18 Feb 2020 17:10:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDBDD2166B29
	for <dm-devel@redhat.com>; Tue, 18 Feb 2020 17:10:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A24E6803004
	for <dm-devel@redhat.com>; Tue, 18 Feb 2020 17:10:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-178-cQD5Lc4-PN6EXaKI0-wbvw-1; Tue, 18 Feb 2020 12:10:07 -0500
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j46Nq-0000qW-2x; Tue, 18 Feb 2020 17:10:06 +0000
Date: Tue, 18 Feb 2020 09:10:06 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Vivek Goyal <vgoyal@redhat.com>
Message-ID: <20200218171006.GC30766@infradead.org>
References: <20200217181653.4706-1-vgoyal@redhat.com>
	<20200217181653.4706-4-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200217181653.4706-4-vgoyal@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: cQD5Lc4-PN6EXaKI0-wbvw-1
X-MC-Unique: 3q8cN10bOymx_vdLEfMTZw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01IHAGUm003757
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm@lists.01.org, vishal.l.verma@intel.com, hch@infradead.org,
	dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	dan.j.williams@intel.com
Subject: Re: [dm-devel] [PATCH v4 3/7] dax,
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

> +static int pmem_dax_zero_page_range(struct dax_device *dax_dev, u64 offset,
> +				    size_t len)
> +{
> +	struct pmem_device *pmem = dax_get_private(dax_dev);
> +	blk_status_t rc;
> +
> +	rc = pmem_do_write(pmem, ZERO_PAGE(0), 0, offset, len);
> +	return blk_status_to_errno(rc);

No real need for the rc variable here.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

