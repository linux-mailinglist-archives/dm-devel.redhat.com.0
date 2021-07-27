Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE653D7F50
	for <lists+dm-devel@lfdr.de>; Tue, 27 Jul 2021 22:36:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627418160;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4Fa5XjY32Fx11pV6rOxmeutwHkeTA1XohCFL3M01Fsg=;
	b=jKkpcHauFRyG6j2EmLBhYD0JAExplPl3Fr0UyJd7tsmJybBenpiymdcoJQ6eTcHfELbVUk
	f6LTrbQgADAwK7ZABAvZSWYoC5T6+F0S7TaCvlkNRseg1gtU+n0sGmIuYCunIy2320FbaM
	5+iD7am7ZbtiNJbd0exGyYqCNfqHpvA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-Cr9Zu00DPnGXe3CODCHeBQ-1; Tue, 27 Jul 2021 16:35:58 -0400
X-MC-Unique: Cr9Zu00DPnGXe3CODCHeBQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A63891007464;
	Tue, 27 Jul 2021 20:35:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABD1B10372F6;
	Tue, 27 Jul 2021 20:35:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1DF124BB7C;
	Tue, 27 Jul 2021 20:35:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16RKXjoE009277 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 27 Jul 2021 16:33:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9530510372F6; Tue, 27 Jul 2021 20:33:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from agk-cloud1.hosts.prod.upshift.rdu2.redhat.com
	(agk-cloud1.hosts.prod.upshift.rdu2.redhat.com [10.0.13.154])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D90E4101E249;
	Tue, 27 Jul 2021 20:33:34 +0000 (UTC)
Received: by agk-cloud1.hosts.prod.upshift.rdu2.redhat.com (Postfix,
	from userid 3883)
	id 6703B41FBD41; Tue, 27 Jul 2021 21:33:37 +0100 (BST)
Date: Tue, 27 Jul 2021 21:33:37 +0100
From: Alasdair G Kergon <agk@redhat.com>
To: Thore Sommer <public@thson.de>
Message-ID: <20210727203337.GA81220@agk-cloud1.hosts.prod.upshift.rdu2.redhat.com>
Mail-Followup-To: Thore Sommer <public@thson.de>,
	tusharsu@linux.microsoft.com, agk@redhat.com, dm-devel@redhat.com,
	linux-integrity@vger.kernel.org, nramas@linux.microsoft.com,
	snitzer@redhat.com, zohar@linux.ibm.com
References: <c833339e-c4bf-6e78-5719-cd902fa8426f@linux.microsoft.com>
	<20210727101802.779067-1-public@thson.de>
MIME-Version: 1.0
In-Reply-To: <20210727101802.779067-1-public@thson.de>
Organization: Red Hat UK Ltd. Registered in England and Wales, number
	03798903. Registered Office: Amberley Place, 107-111 Peascod Street,
	Windsor, Berkshire, SL4 1TE.
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, zohar@linux.ibm.com, nramas@linux.microsoft.com,
	dm-devel@redhat.com, tusharsu@linux.microsoft.com,
	linux-integrity@vger.kernel.org, agk@redhat.com
Subject: Re: [dm-devel] [PATCH 0/7] device mapper target measurements using
 IMA
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

On Tue, Jul 27, 2021 at 12:18:02PM +0200, Thore Sommer wrote:
> No new IMA measurement is generated if dm-verity verification fails. This is
> unfortunate because to make the dm-verity measurements useful we need to be
> notified when hash_failed is set to true. We will need something like
> "device_update" where we remeasure the device state if it has changed.
 
Measurements in the current patchset are only triggered by ioctl calls
initiated by userspace.

Having other triggering mechanisms - such as hooking into internal
events when something unexpected happens - could be considered for
follow-on patches.

> Creating a dm-verity device with mount then removing it and now if you create it
> again no measurement is generated. Is that the expected behavior?  

Each of the relevant dm ioctls should be logged separately each time.  If that's
not happening it might need fixing.

> Is there a reason that suspend is not measured?

A suspend doesn't change the configuration so falls outside the criteria
for this patch set.  (If there is some need for it, it would be covered
by the need to measure internal events that I mentioned above.)
 
> What can happen in between a "table_load" and "device_resume" that is security
> relevant?

The table prepared by the load can be cleared.  That would change the
effect of the resume.
 
> Not directly device mapper related, but it would be nice to also measure the
> mount points and a mapping to the device IDs. 

Again, that would be for future patches building on these ones.

Alasdair

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

