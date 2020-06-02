Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CED0A1EC4E4
	for <lists+dm-devel@lfdr.de>; Wed,  3 Jun 2020 00:27:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591136876;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sM3dmTiYRhuubPfi+rTWopmQiC2RqYL77TNw8fCQbvg=;
	b=CZEvl5/Gm6lIobqKLuFyefO5OImlEiC/dRdoGDxKWTe4ot5WotIxghcIhfa+VdM5lQmVEE
	22gNdsi3Miwr7w4GdvSz2L/zaF3Xg3kaCBm437nbNduFmYEzShbQgAWPf57dOPXUdOYAKt
	4wxBtvycDi0M/q+XXnTk3wtdlbIKWNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-trzmwtY2OKOxVuQPK29o5g-1; Tue, 02 Jun 2020 18:27:54 -0400
X-MC-Unique: trzmwtY2OKOxVuQPK29o5g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DD3280058E;
	Tue,  2 Jun 2020 22:27:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E67C76116D;
	Tue,  2 Jun 2020 22:27:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 681A29701E;
	Tue,  2 Jun 2020 22:27:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 052MROMx022742 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jun 2020 18:27:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CC92D768BB; Tue,  2 Jun 2020 22:27:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E436E1BCBE;
	Tue,  2 Jun 2020 22:27:21 +0000 (UTC)
Date: Tue, 2 Jun 2020 18:27:19 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20200602222719.GA14318@redhat.com>
References: <20200602110956.121170-1-hare@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200602110956.121170-1-hare@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCHv4 00/15] dm-zoned: multiple drive support
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jun 02 2020 at  7:09am -0400,
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
> Changes to v2:
> - Add reviews from Damien
> - Merge patches 'dynamic device allocation' and
>   'support arbitrary number of devices'
> - Fix memory leak when reading tertiary superblocks
> Changes to v3:
> - Add reviews from Damien
> - Add patch to ensure correct device ordering

I've picked this series up for 5.8 (yes, I know it is last minute).  But
I saw no benefit to merging the initial 2 device step in 5.8 only to
then churn the code and interface to support an arbitrary number of
devices in 5.9.  Easier to support one major update to the code now.

As such the target's version number was _not_ bumped from 2.0.0 to
3.0.0.

I tweaked various patch headers (_please_ "dm zoned" instead of
"dm-zoned" in commit subjects, also don't ever say "we" or "this patch"
in a commit header... if you do, I am forced to rewrite the header).

BTW, just so I feel like I said it: all these changes to use additional
device(s) really seems like a tradeoff between performance and reduced
MTBF -- there is increased potential for failure with each additional
device that is added to the dm-zoned device... there I've said it ;)

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

