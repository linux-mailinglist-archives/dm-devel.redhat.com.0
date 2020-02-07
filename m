Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B3FB7155BDF
	for <lists+dm-devel@lfdr.de>; Fri,  7 Feb 2020 17:34:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581093273;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7Wcn1lGZd+2SQVi2KYkPeLEXXuVQBlXv/jqroZNBFEc=;
	b=MzKGkgRREE6KakPUtHIyrlPr7wPXkMTaH5t/wDqmWYBG4Ec/KM7xXWYfZc7ANlot62QMcD
	RZJT0pRyoGY3x1ezm2rAlK9UHA6e0OfxGlc4/dfZr7CgpPDPS1hiPrbKGum7kbsTTglxjB
	QiZheHH/RGmOpXkLp6FKcOcfXp/f/jc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-StgqmGiEPiqNRQ943yrHVw-1; Fri, 07 Feb 2020 11:34:30 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76331113784B;
	Fri,  7 Feb 2020 16:34:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B06F60BF7;
	Fri,  7 Feb 2020 16:34:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 66414866A8;
	Fri,  7 Feb 2020 16:34:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017GY4KF009299 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 11:34:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 86DCE790E5; Fri,  7 Feb 2020 16:34:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F08FD790E1;
	Fri,  7 Feb 2020 16:34:01 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 63FFF220A24; Fri,  7 Feb 2020 11:34:01 -0500 (EST)
Date: Fri, 7 Feb 2020 11:34:01 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200207163401.GB11998@redhat.com>
References: <20200203200029.4592-1-vgoyal@redhat.com>
	<20200203200029.4592-4-vgoyal@redhat.com>
	<20200205183304.GC26711@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200205183304.GC26711@infradead.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, dan.j.williams@intel.com,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: StgqmGiEPiqNRQ943yrHVw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Feb 05, 2020 at 10:33:04AM -0800, Christoph Hellwig wrote:
> On Mon, Feb 03, 2020 at 03:00:27PM -0500, Vivek Goyal wrote:
> > This patch adds support for dax zero_page_range operation to dm targets.
> 
> Any way to share the code with the dax copy iter here?

Had a look at it and can't think of a good way of sharing the code. If
you have something specific in mind, I am happy to make changes.

Vivek

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

