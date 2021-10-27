Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBEE43C462
	for <lists+dm-devel@lfdr.de>; Wed, 27 Oct 2021 09:51:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-vcEpq12QOt2OCWlyYyFViQ-1; Wed, 27 Oct 2021 03:51:31 -0400
X-MC-Unique: vcEpq12QOt2OCWlyYyFViQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56BA69F92E;
	Wed, 27 Oct 2021 07:51:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 210695C1B4;
	Wed, 27 Oct 2021 07:51:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 988994A703;
	Wed, 27 Oct 2021 07:51:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19R7p5cM018031 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 Oct 2021 03:51:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F0F941121318; Wed, 27 Oct 2021 07:51:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC4761121315
	for <dm-devel@redhat.com>; Wed, 27 Oct 2021 07:51:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EB2010AF7C3
	for <dm-devel@redhat.com>; Wed, 27 Oct 2021 07:51:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-573-hTfUFQzxN-Gb5ohrB_o4ag-1; Wed, 27 Oct 2021 03:50:58 -0400
X-MC-Unique: hTfUFQzxN-Gb5ohrB_o4ag-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1mfcl5-0043Vr-Rj; Wed, 27 Oct 2021 06:49:59 +0000
Date: Tue, 26 Oct 2021 23:49:59 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jane Chu <jane.chu@oracle.com>
Message-ID: <YXj2lwrxRxHdr4hb@infradead.org>
References: <20211021001059.438843-1-jane.chu@oracle.com>
	<YXFPfEGjoUaajjL4@infradead.org>
	<e89a2b17-3f03-a43e-e0b9-5d2693c3b089@oracle.com>
	<YXJN4s1HC/Y+KKg1@infradead.org>
	<2102a2e6-c543-2557-28a2-8b0bdc470855@oracle.com>
MIME-Version: 1.0
In-Reply-To: <2102a2e6-c543-2557-28a2-8b0bdc470855@oracle.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: "nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
	"dave.jiang@intel.com" <dave.jiang@intel.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	"djwong@kernel.org" <djwong@kernel.org>,
	"david@fromorbit.com" <david@fromorbit.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"willy@infradead.org" <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"vgoyal@redhat.com" <vgoyal@redhat.com>,
	"vishal.l.verma@intel.com" <vishal.l.verma@intel.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"dan.j.williams@intel.com" <dan.j.williams@intel.com>,
	"ira.weiny@intel.com" <ira.weiny@intel.com>,
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	"agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/6] dax poison recovery with
 RWF_RECOVERY_DATA flag
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 22, 2021 at 08:52:55PM +0000, Jane Chu wrote:
> Thanks - I try to be honest.  As far as I can tell, the argument
> about the flag is a philosophical argument between two views.
> One view assumes design based on perfect hardware, and media error
> belongs to the category of brokenness. Another view sees media
> error as a build-in hardware component and make design to include
> dealing with such errors.

No, I don't think so.  Bit errors do happen in all media, which is
why devices are built to handle them.  It is just the Intel-style
pmem interface to handle them which is completely broken.  

> errors in mind from start.  I guess I'm trying to articulate why
> it is acceptable to include the RWF_DATA_RECOVERY flag to the
> existing RWF_ flags. - this way, pwritev2 remain fast on fast path,
> and its slow path (w/ error clearing) is faster than other alternative.
> Other alternative being 1 system call to clear the poison, and
> another system call to run the fast pwrite for recovery, what
> happens if something happened in between?

Well, my point is doing recovery from bit errors is by definition not
the fast path.  Which is why I'd rather keep it away from the pmem
read/write fast path, which also happens to be the (much more important)
non-pmem read/write path.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

