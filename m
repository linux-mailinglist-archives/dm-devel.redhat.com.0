Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 17D4516138C
	for <lists+dm-devel@lfdr.de>; Mon, 17 Feb 2020 14:31:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581946302;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v/Aduj8I15CCVqlTUjzK8r4dza+5aqp49/oUMzdaoXA=;
	b=aBy6Q6MWNSe7Z6SyismQhauWmfdouZhe5IaFY7h2FLkMoQrsLTdD7q5p3iXcnx8RfUTKS/
	05fjoZdwFYu6xEZnZ33MljsXNe8Up2Cf2xNBPphuK/s96S0wELQ1F4S5tqfph7BI4RiWRE
	hqqBfUZWmjClG8IgT/oEvahIxxrfkSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-qYijDcYkNS2vTOD_yjSibA-1; Mon, 17 Feb 2020 08:31:37 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9E1B107ACC5;
	Mon, 17 Feb 2020 13:31:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75AAD5D9CA;
	Mon, 17 Feb 2020 13:31:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D4C2C8B2B2;
	Mon, 17 Feb 2020 13:31:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HDVOsr004653 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 08:31:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5576D10EE784; Mon, 17 Feb 2020 13:31:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F2A510EE835
	for <dm-devel@redhat.com>; Mon, 17 Feb 2020 13:31:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 350111019299
	for <dm-devel@redhat.com>; Mon, 17 Feb 2020 13:31:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-274-fxM0j0t7P-aByC79khQJOg-1; Mon, 17 Feb 2020 08:31:20 -0500
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j3gUX-00082j-MB; Mon, 17 Feb 2020 13:31:17 +0000
Date: Mon, 17 Feb 2020 05:31:17 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Vivek Goyal <vgoyal@redhat.com>
Message-ID: <20200217133117.GB20444@infradead.org>
References: <20200212170733.8092-1-vgoyal@redhat.com>
	<20200212170733.8092-3-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200212170733.8092-3-vgoyal@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: fxM0j0t7P-aByC79khQJOg-1
X-MC-Unique: qYijDcYkNS2vTOD_yjSibA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01HDVOsr004653
X-loop: dm-devel@redhat.com
Cc: jack@suse.cz, linux-nvdimm@lists.01.org, hch@infradead.org,
	dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	dan.j.williams@intel.com
Subject: Re: [dm-devel] [PATCH 2/6] dax, iomap, ext4, ext2,
 xfs: Save dax_offset in "struct iomap"
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
Content-Disposition: inline

On Wed, Feb 12, 2020 at 12:07:29PM -0500, Vivek Goyal wrote:
> Add a new field "sector_t dax_offset" to "struct iomap". This will be
> filled by filesystems and dax code will make use of this to convert
> sector into page offset (dax_pgoff()), instead of bdev_dax_pgoff(). This
> removes the dependency of having to pass in block device for dax operations.

NAK.  The iomap is not a structure to bolt random layering violation
onto.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

