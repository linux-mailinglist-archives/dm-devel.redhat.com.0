Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D85313D97A2
	for <lists+dm-devel@lfdr.de>; Wed, 28 Jul 2021 23:37:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627508251;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MaPjnWGy/EGP3nEWD8iQrrvDSBcNeiAOXMAutb889BI=;
	b=JgZm9SKra17AQ6/HIBSMe00ip5JSVwRypQzJmS2M9fFscKYOjW9wtpxsh0JiCB4+0ILvkm
	VJB3oszNOFpkd/Hju+JnNSfMhVcYY6K+21GzJdrz/ddq7ORBULID5Q1C4qZlb7tfUDLngD
	hQxg8TmtR1RpQDRaBDu5XkaQvboKwb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-k-EC3lS9NIuTOzS6zp2iEA-1; Wed, 28 Jul 2021 17:37:28 -0400
X-MC-Unique: k-EC3lS9NIuTOzS6zp2iEA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59AF218C8C01;
	Wed, 28 Jul 2021 21:37:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0CE360875;
	Wed, 28 Jul 2021 21:37:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 511B3180BAB0;
	Wed, 28 Jul 2021 21:37:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16SLXw3r004354 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 28 Jul 2021 17:33:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5B8DA6060F; Wed, 28 Jul 2021 21:33:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from agk-cloud1.hosts.prod.upshift.rdu2.redhat.com
	(agk-cloud1.hosts.prod.upshift.rdu2.redhat.com [10.0.13.154])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8171A60875;
	Wed, 28 Jul 2021 21:33:48 +0000 (UTC)
Received: by agk-cloud1.hosts.prod.upshift.rdu2.redhat.com (Postfix,
	from userid 3883)
	id E1D9540B6597; Wed, 28 Jul 2021 22:33:50 +0100 (BST)
Date: Wed, 28 Jul 2021 22:33:50 +0100
From: Alasdair G Kergon <agk@redhat.com>
To: Thore Sommer <public@thson.de>
Message-ID: <20210728213350.GA115575@agk-cloud1.hosts.prod.upshift.rdu2.redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 27, 2021 at 12:18:02PM +0200, Thore Sommer wrote:
> How is the measured uuid created? The format seems to be
> "CRYPT-VERITY-UUID-NAME" where UUID is uuid from the verity device and NAME is
> the device mapper name. Does this naming come from the kernel or libcryptsetup?

See libdevmapper.h:
/*
 * Configure default UUID prefix string.
 * Conventionally this is a short capitalised prefix indicating the subsystem
 * that is managing the devices, e.g. "LVM-" or "MPATH-".
 * To support stacks of devices from different subsystems, recursive functions
 * stop recursing if they reach a device with a different prefix.
 */
int dm_set_uuid_prefix(const char *uuid_prefix);


Each device-mapper device may have a uuid of up to 128 characters plus
trailing NUL.  Whichever piece software activates the device assigns the
uuid (so userspace or kernel boot parameters).  By convention each such
piece of software uses a short prefix ending with a hyphen that
identifies that software as the "owner" (manager) of that dm device.
This means each piece of software can easily filter out the devices for
which it is responsible and ignore all the others etc.  It can use the
remainder of the UUID to identify the device uniquely to itself.
Another convention is that when one device is a 'wrapper' of some sort
around another, it may create the uuid by adding its prefix to the uuid
of the device it is wrapping - this might give you stacked prefixes.
When there's a complex one-composed-from-many device structure, suffices
may be used to identify the components.

Think of the 'name' as the human-friendly device name and the uuid as
a software-friendly internal name.

Alasdair

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

