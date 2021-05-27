Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 32D3B39293F
	for <lists+dm-devel@lfdr.de>; Thu, 27 May 2021 10:10:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-7FO4kCvlPe-rgkuP4JIsCA-1; Thu, 27 May 2021 04:10:47 -0400
X-MC-Unique: 7FO4kCvlPe-rgkuP4JIsCA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38123501E0;
	Thu, 27 May 2021 08:10:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D48186A857;
	Thu, 27 May 2021 08:10:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED1EE1800BB8;
	Thu, 27 May 2021 08:10:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14R8AC0G028850 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 May 2021 04:10:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A4FCD1054F92; Thu, 27 May 2021 08:10:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A110D1054FDD
	for <dm-devel@redhat.com>; Thu, 27 May 2021 08:10:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4AF78556F8
	for <dm-devel@redhat.com>; Thu, 27 May 2021 08:10:09 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-97-G1AhavRWPUqa55JZ4_iWNA-1; Thu, 27 May 2021 04:10:06 -0400
X-MC-Unique: G1AhavRWPUqa55JZ4_iWNA-1
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lmAiC-005IWB-Jz; Thu, 27 May 2021 07:45:53 +0000
Date: Thu, 27 May 2021 08:45:48 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <YK9OLO6Pc1b13dRj@infradead.org>
References: <alpine.LRH.2.02.2105251548340.29706@file01.intranet.prod.int.rdu2.redhat.com>
	<CH2PR04MB70783B1B24BD10E2BE380D1FE7259@CH2PR04MB7078.namprd04.prod.outlook.com>
	<alpine.LRH.2.02.2105261013460.25928@file01.intranet.prod.int.rdu2.redhat.com>
	<DM6PR04MB70817B208C96D2F568927EA3E7239@DM6PR04MB7081.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM6PR04MB70817B208C96D2F568927EA3E7239@DM6PR04MB7081.namprd04.prod.outlook.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Mike Snitzer <msnitzer@redhat.com>, Mikulas Patocka <mpatocka@redhat.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2] dm-kcopyd: avoid useless atomic operations
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 27, 2021 at 05:21:24AM +0000, Damien Le Moal wrote:
> > -	unsigned long flags;
> > +	unsigned flags;
> 
> This triggers a checkpatch warning. "unsigned int" would be better.

No, it wouldn't.  checkpatch is completely full of shit as usual.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

