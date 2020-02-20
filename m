Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A27B91662FB
	for <lists+dm-devel@lfdr.de>; Thu, 20 Feb 2020 17:32:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582216330;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iS7wk5huOVnF0xPfW2ic67xtw+RgfGZ5fSes+RBMw5U=;
	b=Zxt8bUqsDIlVVhCN4E6kvVu4rWpSZNs2TubsCbcqljJv9dX72y4n2QJyDv16pBLKr7DIhT
	b9SB8QESX1TMVWzI0ki7nQVSw6/jE6OJLma3OjlZDdCSeqm4wJkJHjwONksbSryRgQ4ogK
	xzKJedH+G0PuliX331jxS/zX3ZFNmu8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-11MpGyf7PJWZwyqLptphhg-1; Thu, 20 Feb 2020 11:32:06 -0500
X-MC-Unique: 11MpGyf7PJWZwyqLptphhg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF2BA800D5E;
	Thu, 20 Feb 2020 16:31:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89BA487B0A;
	Thu, 20 Feb 2020 16:31:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 723E018089C8;
	Thu, 20 Feb 2020 16:31:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KGVVZP029742 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 11:31:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 131DC13BB8A; Thu, 20 Feb 2020 16:31:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C61C713BB86
	for <dm-devel@redhat.com>; Thu, 20 Feb 2020 16:31:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2AF0185A78E
	for <dm-devel@redhat.com>; Thu, 20 Feb 2020 16:31:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-324-t8QNfdHEPUmLXJwIpCOvFA-1; Thu, 20 Feb 2020 11:31:25 -0500
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4oW4-0008HH-K2; Thu, 20 Feb 2020 16:17:32 +0000
Date: Thu, 20 Feb 2020 08:17:32 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Vivek Goyal <vgoyal@redhat.com>
Message-ID: <20200220161732.GB31606@infradead.org>
References: <20200218214841.10076-1-vgoyal@redhat.com>
	<20200218214841.10076-4-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218214841.10076-4-vgoyal@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: t8QNfdHEPUmLXJwIpCOvFA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01KGVVZP029742
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm@lists.01.org, vishal.l.verma@intel.com, hch@infradead.org,
	dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	dan.j.williams@intel.com
Subject: Re: [dm-devel] [PATCH v5 3/8] pmem: Enable pmem_do_write() to deal
 with arbitrary ranges
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Feb 18, 2020 at 04:48:36PM -0500, Vivek Goyal wrote:
> Currently pmem_do_write() is written with assumption that all I/O is
> sector aligned. Soon I want to use this function in zero_page_range()
> where range passed in does not have to be sector aligned.
> 
> Modify this function to be able to deal with an arbitrary range. Which
> is specified by pmem_off and len.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

