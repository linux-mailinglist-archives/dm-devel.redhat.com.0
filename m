Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4450537490A
	for <lists+dm-devel@lfdr.de>; Wed,  5 May 2021 22:06:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620245174;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XfsfXCO9JCyyRRCc7r62/RagiVag1Us1iMr702IoY5s=;
	b=Y6V7b78lX/kss2EKV8rFijK+2denYgeoMVvw9zdPa8Bq++owEgK9GW5GURTeiTCj6c7J2m
	k1/RlU4nCod+zSMxiiODqe43f11G8nh70UpvH5k9j45ivddoqvqrtgEwaXBsMdeyAhz92y
	eta95y6Pmr6UzDAeKxoI77I7dKedCa8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-Qsp-EVU7Mx2R8rRr78zTMg-1; Wed, 05 May 2021 16:06:11 -0400
X-MC-Unique: Qsp-EVU7Mx2R8rRr78zTMg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 850D1801AC1;
	Wed,  5 May 2021 20:06:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B47E95D6AC;
	Wed,  5 May 2021 20:06:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B7EF18005B6;
	Wed,  5 May 2021 20:05:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 145K5eJ3023168 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 May 2021 16:05:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3BF405C1C5; Wed,  5 May 2021 20:05:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A870A5C1A3;
	Wed,  5 May 2021 20:05:36 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 145K5ZYc006326; Wed, 5 May 2021 16:05:35 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 145K5Z53006322; Wed, 5 May 2021 16:05:35 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 5 May 2021 16:05:35 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Melvin Vermeeren <vermeeren@vermwa.re>
In-Reply-To: <2912930.OmXdaqUpTP@verm-r4e>
Message-ID: <alpine.LRH.2.02.2105051604580.32187@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2104281658430.9959@file01.intranet.prod.int.rdu2.redhat.com>
	<6810395.sd9NxXGo4T@verm-r4e>
	<alpine.LRH.2.02.2105051444010.31064@file01.intranet.prod.int.rdu2.redhat.com>
	<2912930.OmXdaqUpTP@verm-r4e>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, dm-devel@redhat.com,
	Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] [PATCH v2] dm-integrity: if we have discard support,
 use it when recalculating
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Wed, 5 May 2021, Melvin Vermeeren wrote:

> Hi,
> 
> On Wednesday, 5 May 2021 20:48:47 CEST Mikulas Patocka wrote:
> > It doesn't matter if the device is discarded or not. If the metadata
> > constains the discard filler, dm-integrity won't check the checksum - so
> > the data can contain anything.
> > 
> > ...
> >
> > The device after discard may contain random pattern (some SSDs really do)
> > - so when the metadata contains the discard filler, the data may contain
> > anything.
> 
> So if an existing SSD is formatted with --no-wipe --data-device option and 
> then opened with --integrity-recalculate all metadata will contain the discard 
> filler with this patch.
> 
> So then, all the current data in the drive is not checked for integrity 
> because it contains discard filler. This means that integrity recalculation 
> itself never takes place for existing data. Meaning that only newly written 
> data to SSD device will actually have integrity protection.
> 
> Is this correct?

Yes.

Mikulas

> Cheers,
> 
> -- 
> Melvin Vermeeren
> Systems engineer

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

