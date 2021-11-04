Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A938B4458E8
	for <lists+dm-devel@lfdr.de>; Thu,  4 Nov 2021 18:47:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-LaGb3CLEPh6XR75fvdzzBQ-1; Thu, 04 Nov 2021 13:47:16 -0400
X-MC-Unique: LaGb3CLEPh6XR75fvdzzBQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10EF71B18BC3;
	Thu,  4 Nov 2021 17:47:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38B355F4F5;
	Thu,  4 Nov 2021 17:47:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C16C1806D03;
	Thu,  4 Nov 2021 17:47:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A4HkrEb006782 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Nov 2021 13:46:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A40B2400F3C6; Thu,  4 Nov 2021 17:46:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FE1640D1B9E
	for <dm-devel@redhat.com>; Thu,  4 Nov 2021 17:46:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 873FD802812
	for <dm-devel@redhat.com>; Thu,  4 Nov 2021 17:46:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-40-CvefeXj9PW6oPNiZ13FksA-1; Thu, 04 Nov 2021 13:46:49 -0400
X-MC-Unique: CvefeXj9PW6oPNiZ13FksA-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1migoz-009i9L-Fp; Thu, 04 Nov 2021 17:46:41 +0000
Date: Thu, 4 Nov 2021 10:46:41 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <YYQcgdRShSji3LfM@infradead.org>
References: <e89a2b17-3f03-a43e-e0b9-5d2693c3b089@oracle.com>
	<YXJN4s1HC/Y+KKg1@infradead.org>
	<2102a2e6-c543-2557-28a2-8b0bdc470855@oracle.com>
	<YXj2lwrxRxHdr4hb@infradead.org>
	<20211028002451.GB2237511@magnolia>
	<YYDYUCCiEPXhZEw0@infradead.org>
	<dfca8558-ad70-41d5-1131-63db66b70542@oracle.com>
	<CAPcyv4jLn4_SYxLtp_cUT=mm6Y3An22BA+sqex1S-CBnAm6qGA@mail.gmail.com>
	<YYObn+0juAFvH7Fk@infradead.org>
	<CAPcyv4jaCj=qDw-MHEcYjVGHYGvX8wbJ_d3kv5nnv7agHnMViQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPcyv4jaCj=qDw-MHEcYjVGHYGvX8wbJ_d3kv5nnv7agHnMViQ@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: dm-devel@redhat.com
Cc: Jane Chu <jane.chu@oracle.com>,
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
	"dave.jiang@intel.com" <dave.jiang@intel.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	"vishal.l.verma@intel.com" <vishal.l.verma@intel.com>,
	"david@fromorbit.com" <david@fromorbit.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"willy@infradead.org" <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"vgoyal@redhat.com" <vgoyal@redhat.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 04, 2021 at 09:08:41AM -0700, Dan Williams wrote:
> Yes, atomic clear+write new data. The ability to atomic clear requires
> either a CPU with the ability to overwrite cachelines without doing a
> RMW cycle (MOVDIR64B), or it requires a device with a suitable
> slow-path mailbox command like the one defined for CXL devices (see
> section 8.2.9.5.4.3 Clear Poison in CXL 2.0).
> 
> I don't know why you think these devices don't perform wear-leveling
> with spare blocks?

Because the interface looks so broken.  But yes, apparently it's not
the media management that is broken but just the inteface that fakes
up byte level access.

> All kernel accesses do use it. They either route to
> pmem_copy_to_iter(), or like dm-writecache, call it directly. Do you
> see a kernel path that does not use that helper?

No, sorry.  My knowledge is out of date.
(nova does, but it is out of tree, and the lack of using
copy_mc_to_kernel is the least of its problems)

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

