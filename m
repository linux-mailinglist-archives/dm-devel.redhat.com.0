Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB5914BDAB
	for <lists+dm-devel@lfdr.de>; Tue, 28 Jan 2020 17:26:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580228813;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rm9wL4ePPyorFgKzg3hU6Ym4CGA58D54ux7CD+4U11E=;
	b=fyLLbmczJUWa37aoI+fg9eWjgFd8u/I9vl7OOvIq/9AZEnNcN06ShS467ILPOV8LpoEYRd
	OuO1Qw/HIKNgivAB3PR05PlCIhVhk3XjpCqC9UgiwdxrcQESpNPXV1Un2ziA0jIW0cnYPc
	cSutRVZtqfjWUDEunhNe/AFkjNPzyIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-vZ6PGKSlOJizQqeb1vj_QA-1; Tue, 28 Jan 2020 11:26:50 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE47E100551C;
	Tue, 28 Jan 2020 16:26:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E102260C21;
	Tue, 28 Jan 2020 16:26:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB51418089CE;
	Tue, 28 Jan 2020 16:26:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00SGQGAp027236 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Jan 2020 11:26:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A87BD88838; Tue, 28 Jan 2020 16:26:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A189863DE;
	Tue, 28 Jan 2020 16:26:11 +0000 (UTC)
Date: Tue, 28 Jan 2020 11:26:10 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Stefan Bader <stefan.bader@canonical.com>
Message-ID: <20200128162610.GA15575@redhat.com>
References: <20200123091713.12623-1-stefan.bader@canonical.com>
	<20200123091713.12623-2-stefan.bader@canonical.com>
	<20200123103541.GA28102@redhat.com>
	<20200123172816.GA31063@redhat.com>
	<81055166-37fb-ad65-6a53-11c22c626ab1@kernel.dk>
	<20200127193225.GA5065@redhat.com>
	<e0475dae-a55f-f30e-a82f-ee35cdb171c4@canonical.com>
MIME-Version: 1.0
In-Reply-To: <e0475dae-a55f-f30e-a82f-ee35cdb171c4@canonical.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Tyler Hicks <tyler.hicks@canonical.com>, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/1] blk/core: Gracefully handle unset
	make_request_fn
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: vZ6PGKSlOJizQqeb1vj_QA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jan 28 2020 at  9:32am -0500,
Stefan Bader <stefan.bader@canonical.com> wrote:

> On 27.01.20 20:32, Mike Snitzer wrote:
> > 
> > I just staged the following DM fix:
> > https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.6&id=28a101d6b344f5a38d482a686d18b1205bc92333
> 
> Thanks Mike,
> 
> yeah this looks like it resolves the problem without adding any impact on the
> generic I/O path. We certainly had thought about that but felt uncertain whether
> it would not open other risks. Like something adding requests just before the
> table load. Could this cause some I/O be handled by one function and the rest by
> another? And would that really matter?

I considered this too.  Any IO issued to the device before it is "ready"
won't matter anyway (no where to send the IO due to not having a DM
table -- such IO should result in an error (from dm.c:dm_process_bio's
!map check).  But given the device has no size, a simple write will hit
-ENOSPC before.

And the only way to get the DM device to have a proper destination for
its IO is to load a table, which requires a sequence like:

# dmsetup create -n test
# dmsetup table
test:
# echo "0 20971520 linear 259:0 2048" | dmsetup load test
# dmsetup table --inactive
test: 0 20971520 linear 259:0 2048
# dmsetup suspend test
# dmsetup resume test
# dmsetup table
test: 0 20971520 linear 259:0 2048

And once a table is loaded there will be accompanying change
uevents that trigger udev, blkid, etc.

(NOTE: the suspend phase implies a flush of all outstanding IO, but even
if 'dmsetup suspend --noflush test' were used the IO would just get
pushed onto a list in DM core and it would be issued after the new table
is in place).

> The other thing that was a bit strange but maybe someone else's problem is that
> mount generated I/O requests to start with. The device size should be 0 still.

That's just mount not having a negative check for device size being 0.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

