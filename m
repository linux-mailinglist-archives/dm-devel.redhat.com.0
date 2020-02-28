Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id F252D1739F5
	for <lists+dm-devel@lfdr.de>; Fri, 28 Feb 2020 15:36:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582900588;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ohFAcYEyPGS/NBLsarEHNCMqeYg3jWPOfkai1PhTzuY=;
	b=CFYzHUaUHS9QZgEXNGaRfkxcaSoxXtmCf0eocu5YN+2de2pyvD3t6J/JBSL0WMdGcegKil
	a5SVMeDrORRLR6Z3YKG12l6v83nP/v/fxu0a2v6wXz2EzKLBdQJWSBa1v9t1+b1Idexs6y
	Wmt78cJ8Yrp7qTFLwOPfw5oi78tkjuo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-QKm6o50eOO2_gjvMY1dE8g-1; Fri, 28 Feb 2020 09:36:26 -0500
X-MC-Unique: QKm6o50eOO2_gjvMY1dE8g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A4BE8017CC;
	Fri, 28 Feb 2020 14:36:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16A451001902;
	Fri, 28 Feb 2020 14:36:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 89626180338F;
	Fri, 28 Feb 2020 14:36:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01SEZlvI030002 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 28 Feb 2020 09:35:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0F93F13AF76; Fri, 28 Feb 2020 14:35:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B99913AF6B
	for <dm-devel@redhat.com>; Fri, 28 Feb 2020 14:35:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A7EE185A790
	for <dm-devel@redhat.com>; Fri, 28 Feb 2020 14:35:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-190-zelfO7T9NnqK0BwYaHV9KA-1; Fri, 28 Feb 2020 09:35:41 -0500
X-MC-Unique: zelfO7T9NnqK0BwYaHV9KA-1
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j7gGK-00048K-IE; Fri, 28 Feb 2020 14:05:08 +0000
Date: Fri, 28 Feb 2020 06:05:08 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20200228140508.GA2987@infradead.org>
References: <x49lfoxj622.fsf@segfault.boston.devel.redhat.com>
	<20200220215707.GC10816@redhat.com>
	<x498skv3i5r.fsf@segfault.boston.devel.redhat.com>
	<20200221201759.GF25974@redhat.com>
	<20200223230330.GE10737@dread.disaster.area>
	<20200224153844.GB14651@redhat.com>
	<20200227030248.GG10737@dread.disaster.area>
	<CAPcyv4gTSb-xZ2k938HxQeAXATvGg1aSkEGPfrzeQAz9idkgzQ@mail.gmail.com>
	<20200228013054.GO10737@dread.disaster.area>
	<CAPcyv4i2vjUGrwaRsjp1-L0wFf0a00e46F-SUbocQBkiQ3M1kg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPcyv4i2vjUGrwaRsjp1-L0wFf0a00e46F-SUbocQBkiQ3M1kg@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01SEZlvI030002
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>,
	Dave Chinner <david@fromorbit.com>,
	device-mapper development <dm-devel@redhat.com>,
	Christoph Hellwig <hch@infradead.org>, Jeff Moyer <jmoyer@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [dm-devel] [PATCH v5 2/8] drivers/pmem: Allow
 pmem_clear_poison() to accept arbitrary offset and len
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

On Thu, Feb 27, 2020 at 07:28:41PM -0800, Dan Williams wrote:
> "don't perform generic memory-error-handling, there's an fs that owns
> this daxdev and wants to disposition errors". The fs/dax.c
> infrastructure that sets up ->index and ->mapping would still need to
> be there for ext4 until its ready to take on the same responsibility.
> Last I checked the ext4 reverse mapping implementation was not as
> capable as XFS. This goes back to why the initial design avoided
> relying on not universally available / stable reverse-mapping
> facilities and opted for extending the generic mm/memory-failure.c
> implementation.

The important but is that we stop using ->index and ->mapping when XFS
is used as that enables using DAX+reflinks, which actually is the most
requested DAX feature on XFS (way more than silly runtime flag switches
for example).


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

