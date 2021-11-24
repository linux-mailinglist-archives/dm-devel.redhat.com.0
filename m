Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 317C745B0D3
	for <lists+dm-devel@lfdr.de>; Wed, 24 Nov 2021 01:45:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637714732;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3epREWuK/WopUnM7gO7wQyeRT68xx2l+16zE5ACicdI=;
	b=QSg6CEd1qEFC9FRUZ1eMosC1+cNMZ/6I2TtugEMRkMyvEkZKlefZ+WBd34JfdWdfHn/GDZ
	YWYR4D/o7eP5U83XI5VAZFwLPLfPFJsEVXZX6ncVuZ2egFI8BE7SHw45IRfdtxpUAjwzPy
	xBB3hQL+CMjHoWR/n78OZlQZLJB3vWg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-V_1Sh8dOMR21Ha4FFa-Wlg-1; Tue, 23 Nov 2021 19:45:28 -0500
X-MC-Unique: V_1Sh8dOMR21Ha4FFa-Wlg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35AE483DD62;
	Wed, 24 Nov 2021 00:45:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E12821001F50;
	Wed, 24 Nov 2021 00:45:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 001504EA2A;
	Wed, 24 Nov 2021 00:44:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AO0eemv006084 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 23 Nov 2021 19:40:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 13617607D5; Wed, 24 Nov 2021 00:40:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from agk-cloud1.hosts.prod.upshift.rdu2.redhat.com
	(agk-cloud1.hosts.prod.upshift.rdu2.redhat.com [10.0.13.154])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD3285DF5E;
	Wed, 24 Nov 2021 00:40:27 +0000 (UTC)
Received: by agk-cloud1.hosts.prod.upshift.rdu2.redhat.com (Postfix,
	from userid 3883)
	id 1F4F2424F08E; Wed, 24 Nov 2021 00:38:31 +0000 (GMT)
Date: Wed, 24 Nov 2021 00:38:31 +0000
From: Alasdair G Kergon <agk@redhat.com>
To: Akilesh Kailash <akailash@google.com>
Message-ID: <20211124003831.GB63964@agk-cloud1.hosts.prod.upshift.rdu2.redhat.com>
Mail-Followup-To: Akilesh Kailash <akailash@google.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Mike Snitzer <msnitzer@redhat.com>,
	Alasdair Kergon <agk@redhat.com>,
	Jonathan Brassow <jbrassow@redhat.com>,
	Heinz Mauelshagen <heinzm@redhat.com>,
	David Anderson <dvander@google.com>, dm-devel@redhat.com
References: <alpine.LRH.2.02.2111231421490.24195@file01.intranet.prod.int.rdu2.redhat.com>
	<CABSDvDL23UZ8KMrjK+qm0Lw0bfDaWh2TruZ2kLgGXqidgOt0jQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABSDvDL23UZ8KMrjK+qm0Lw0bfDaWh2TruZ2kLgGXqidgOt0jQ@mail.gmail.com>
Organization: Red Hat UK Ltd. Registered in England and Wales, number
	03798903. Registered Office: Amberley Place, 107-111 Peascod Street,
	Windsor, Berkshire, SL4 1TE.
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, Heinz Mauelshagen <heinzm@redhat.com>,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	David Anderson <dvander@google.com>, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH] announcing the dm-update target
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 23, 2021 at 04:07:21PM -0800, Akilesh Kailash wrote:
> Why not extend dm-snapshot; in that way you can have the existing
> kernel COW format + support compression.

In short, this is quite a focussed requirement and it doesn't seem worth
compromising on the goals by attempting to shoe-horn it into a framework
that was designed to fit around some quite different constraints twenty
years ago.

> I understand this for read-only but if dm-snapshot supports it,
> existing users  can have the
> compression feature if required.

I doubt that anyone wants to develop dm-snapshot any further.  It's only
really good for small short-term snapshots where performance and memory
usage don't matter.  The more-sophisticated thin provisioning approach
replaced it.

> Also, I am curious what are the other real world use case here apart
> from Android ?

There seems to be a general industry movement towards edge, attestation,
trusted boot, nested systems, confidential computing, containers,
<insert your favourite buzzwords> etc. and I think this type of
device-mapper target might play a useful role as one of the low-level
components involved in building up support for some of those scenarios.
(Just as we recently began adding support for attestation.)
 
Alasdair

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

