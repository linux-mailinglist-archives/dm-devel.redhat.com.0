Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C7FDD1659D2
	for <lists+dm-devel@lfdr.de>; Thu, 20 Feb 2020 10:06:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582189609;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ct2ErRycE4Sju/cT2miW9e/AZPvo6NNgsNdttdY4x20=;
	b=EzvbBqo1hbDDTBQxKhzR5+/rIZ2LABWmgNk547Ogr7I+wY3zl63VYNHTSAtDIygjkn3IdP
	NA+dviKgglUumoKICkrUq6yOVyXW1KsCms+1Cn3xsxC2EkhJRoHJqqeUf2GLvc6pOQGRU9
	7YaO0TBSrDndJ/2vuoEMBn8CwnrbtEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-Ml9OjLDQMKG-IK0lL5pPug-1; Thu, 20 Feb 2020 04:06:46 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28B878024CC;
	Thu, 20 Feb 2020 09:06:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 009F01001925;
	Thu, 20 Feb 2020 09:06:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B53935B1F;
	Thu, 20 Feb 2020 09:06:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HDbrxC005052 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 08:37:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C73DF205EB04; Mon, 17 Feb 2020 13:37:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1BCE2026D69
	for <dm-devel@redhat.com>; Mon, 17 Feb 2020 13:37:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADC85802708
	for <dm-devel@redhat.com>; Mon, 17 Feb 2020 13:37:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-252-YrS_th_aPO6kHM3I1UNnqg-1; Mon, 17 Feb 2020 08:37:49 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j3gap-0002YG-Fr; Mon, 17 Feb 2020 13:37:47 +0000
Date: Mon, 17 Feb 2020 05:37:47 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Vivek Goyal <vgoyal@redhat.com>
Message-ID: <20200217133747.GJ7778@bombadil.infradead.org>
References: <20200212170733.8092-1-vgoyal@redhat.com>
	<20200212170733.8092-2-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200212170733.8092-2-vgoyal@redhat.com>
X-MC-Unique: YrS_th_aPO6kHM3I1UNnqg-1
X-MC-Unique: Ml9OjLDQMKG-IK0lL5pPug-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01HDbrxC005052
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 20 Feb 2020 04:05:51 -0500
Cc: jack@suse.cz, linux-nvdimm@lists.01.org, hch@infradead.org,
	dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	dan.j.williams@intel.com
Subject: Re: [dm-devel] [PATCH 1/6] dax: Define a helper dax_pgoff() which
 takes in dax_offset as argument
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Feb 12, 2020 at 12:07:28PM -0500, Vivek Goyal wrote:
> +int dax_pgoff(sector_t dax_offset, sector_t sector, size_t size, pgoff_t *pgoff)
> +{
> +	phys_addr_t phys_off = (dax_offset + sector) * 512;
> +
> +	if (pgoff)
> +		*pgoff = PHYS_PFN(phys_off);
> +	if (phys_off % PAGE_SIZE || size % PAGE_SIZE)
> +		return -EINVAL;
> +	return 0;

This is why we have IS_ERR_VALUE().  Just make this function return
a pgoff_t.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

