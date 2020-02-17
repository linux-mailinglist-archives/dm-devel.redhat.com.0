Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4BDBB161351
	for <lists+dm-devel@lfdr.de>; Mon, 17 Feb 2020 14:28:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581946083;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FpyTaD98rAUzUzXccvQt4mGoYoSa3eE+Tc5Jcg2R9N4=;
	b=eeiveKbcV/f4FDZIO5PCKf3T2ayAedDAiD7wnXuchRwvtQFWb3VQzxn1VovIkndugHtBSU
	uxo89WEEn2yueqvmeBMnHqcC0g1tuztdHKkhvYEvGRROlKZ+k3X30VsQS0xofeE2xj893E
	ERBZJDsE2Z4vOWvDE6GP9oxoxRjOvWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-m1ZYt8kGP8eVqNicSqSZ5w-1; Mon, 17 Feb 2020 08:27:59 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CFC2107ACCC;
	Mon, 17 Feb 2020 13:27:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6980E60BE1;
	Mon, 17 Feb 2020 13:27:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A13218034EB;
	Mon, 17 Feb 2020 13:27:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HDRlj3004402 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 08:27:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 62D062028CD4; Mon, 17 Feb 2020 13:27:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D4E52038B80
	for <dm-devel@redhat.com>; Mon, 17 Feb 2020 13:27:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41D47802085
	for <dm-devel@redhat.com>; Mon, 17 Feb 2020 13:27:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-434-BOmqzA7hNZ2JJayDDLORBA-1; Mon, 17 Feb 2020 08:27:43 -0500
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j3gR3-0005AS-AB; Mon, 17 Feb 2020 13:27:41 +0000
Date: Mon, 17 Feb 2020 05:27:41 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Vivek Goyal <vgoyal@redhat.com>
Message-ID: <20200217132741.GF14490@infradead.org>
References: <20200207202652.1439-1-vgoyal@redhat.com>
	<20200207202652.1439-8-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200207202652.1439-8-vgoyal@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: BOmqzA7hNZ2JJayDDLORBA-1
X-MC-Unique: m1ZYt8kGP8eVqNicSqSZ5w-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01HDRlj3004402
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm@lists.01.org, vishal.l.verma@intel.com, hch@infradead.org,
	dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	dan.j.williams@intel.com
Subject: Re: [dm-devel] [PATCH v3 7/7] dax,
 iomap: Add helper dax_iomap_zero() to zero a range
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

On Fri, Feb 07, 2020 at 03:26:52PM -0500, Vivek Goyal wrote:
> Add a helper dax_ioamp_zero() to zero a range. This patch basically
> merges __dax_zero_page_range() and iomap_dax_zero().
> 
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  fs/dax.c               | 12 ++++++------
>  fs/iomap/buffered-io.c |  9 +--------
>  include/linux/dax.h    | 17 +++--------------
>  3 files changed, 10 insertions(+), 28 deletions(-)

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

