Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A98851E4407
	for <lists+dm-devel@lfdr.de>; Wed, 27 May 2020 15:41:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590586900;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dINc17YVl1vAsoCoeAfTj2pIuMyuc7cylEt3cdbcWPk=;
	b=TId65Qnp+flDHbGz+L6b/f5IWsvE1iDy/gK/r2XivuP1O3uB6seNsduAz4ER4caU2jHEa9
	4k7c7y3TTL/N822v8mMqYxOG/Zxm6dyN45opHNovxxPi4kP9mc1fZTm5vrJ8wmEWWvhseo
	icETG7Ii4yOtwpy0LJd4oDBJ4Prorn4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-jtwLI_slMbOpj4NNemxZWg-1; Wed, 27 May 2020 09:41:37 -0400
X-MC-Unique: jtwLI_slMbOpj4NNemxZWg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F302107ACCD;
	Wed, 27 May 2020 13:41:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B88D5C1B0;
	Wed, 27 May 2020 13:41:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 621DF1809541;
	Wed, 27 May 2020 13:41:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04RDfF3m016593 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 09:41:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 297425C1C5; Wed, 27 May 2020 13:41:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 342235C1B0;
	Wed, 27 May 2020 13:41:12 +0000 (UTC)
Date: Wed, 27 May 2020 09:41:11 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20200527134110.GB19310@redhat.com>
References: <20200527062225.72849-1-hare@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200527062225.72849-1-hare@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCHv2 00/15] dm-zoned: multi-device support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, May 27 2020 at  2:22am -0400,
Hannes Reinecke <hare@suse.de> wrote:

> Hi all,
> 
> here's the second version of my patchset to support multiple zoned
> drives with dm-zoned.
> This patchset:
> - Converts the zone array to using xarray for better scalability
> - Separates out shared structures into per-device structure
> - Enforce drive-locality for allocating and reclaiming zones
> - Lifts the restriction of 2 devices to handle an arbitrary number
>   of drives.
> 
> This gives me a near-perfect scalability by increasing the write
> speed from 150MB/s (for a cache and one zoned drive) to 300MB/s
> (for a cache and two zoned drives).
> 
> Changes to v1:
> - Include reviews from Damien
> - Reshuffle patches
> 
> Hannes Reinecke (15):
>   dm-zoned: add debugging message for reading superblocks
>   dm-zoned: secondary superblock must reside on the same devices than
>     primary superblock
>   dm-zoned: improve logging messages for reclaim
>   dm-zoned: add a 'reserved' zone flag
>   dm-zoned: convert to xarray
>   dm-zoned: temporary superblock for tertiary devices
>   dm-zoned: add device pointer to struct dm_zone
>   dm-zoned: add metadata pointer to struct dmz_dev
>   dm-zoned: allocate dm devices dynamically
>   dm-zoned: per-device reclaim
>   dm-zoned: move random and sequential zones into struct dmz_dev
>   dm-zoned: support arbitrary number of devices
>   dm-zoned: allocate zone by device index
>   dm-zoned: select reclaim zone based on device index
>   dm-zoned: prefer full zones for reclaim
> 
>  drivers/md/dm-zoned-metadata.c | 448 ++++++++++++++++++++++++-----------------
>  drivers/md/dm-zoned-reclaim.c  |  95 +++++----
>  drivers/md/dm-zoned-target.c   | 169 ++++++++++------
>  drivers/md/dm-zoned.h          |  77 ++++---
>  4 files changed, 481 insertions(+), 308 deletions(-)

Would you still like to wait until the 5.9 merge window?

Or would you prefer to see these changes land for 5.8 so as to limit the
variants of related code that needs to be supported?

If you and Damien are OK with 5.8 (and testing backs that up) then I
should be able to get it to land.

Let me know, thanks.
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

