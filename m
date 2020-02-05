Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id F31D3153831
	for <lists+dm-devel@lfdr.de>; Wed,  5 Feb 2020 19:33:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580927612;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GzR+pY+jlrTMeZv74jdzXGd0ZPB0dZOc90zDXND3/gI=;
	b=a/fnq7At/HHguAH4+uT/JeWkN6A1K0JHIJdziTqn53RNumP2M1kh6Ql+n+3ScihJfcalmu
	ChMfWnlpO7zUibI1nVQ9+z9gmbYK7Zqjlig4xdo6uTCOJ43rQOaPWX1SfnX69NqEEWkZ5F
	HC1PiCyrLKaPu7MyeQC5hgPD+R7YiPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-Xun1qUFDOcq9pXAfltLBoA-1; Wed, 05 Feb 2020 13:33:26 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2105D100551A;
	Wed,  5 Feb 2020 18:33:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87F79790D3;
	Wed,  5 Feb 2020 18:33:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D377E18089CD;
	Wed,  5 Feb 2020 18:33:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015IXCEc018509 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 13:33:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E22B010AF425; Wed,  5 Feb 2020 18:33:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDB1010AF424
	for <dm-devel@redhat.com>; Wed,  5 Feb 2020 18:33:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25F5A80419F
	for <dm-devel@redhat.com>; Wed,  5 Feb 2020 18:33:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-223-_1U3abzOM5OgUWCEI1DCOA-1; Wed, 05 Feb 2020 13:33:08 -0500
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1izPU1-0001ax-0N; Wed, 05 Feb 2020 18:33:05 +0000
Date: Wed, 5 Feb 2020 10:33:04 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Vivek Goyal <vgoyal@redhat.com>
Message-ID: <20200205183304.GC26711@infradead.org>
References: <20200203200029.4592-1-vgoyal@redhat.com>
	<20200203200029.4592-4-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200203200029.4592-4-vgoyal@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: _1U3abzOM5OgUWCEI1DCOA-1
X-MC-Unique: Xun1qUFDOcq9pXAfltLBoA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 015IXCEc018509
X-loop: dm-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, hch@infradead.org, dan.j.williams@intel.com,
	dm-devel@redhat.com, linux-nvdimm@lists.01.org
Subject: Re: [dm-devel] [PATCH 3/5] dm,
	dax: Add dax zero_page_range operation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Feb 03, 2020 at 03:00:27PM -0500, Vivek Goyal wrote:
> This patch adds support for dax zero_page_range operation to dm targets.

Any way to share the code with the dax copy iter here?


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

