Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 345521B5D09
	for <lists+dm-devel@lfdr.de>; Thu, 23 Apr 2020 15:59:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587650391;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nYr9HY+LwpUEknLdQ57g3NjVUFC5va16FfJGzFhNEUY=;
	b=RQCQah7PjuwkCeFrqW5gcWYyYAlp5b/hMh8MuDWSLjIE7App39uXkU3l7RZxUzJgkv8Cwy
	lY43o+SzzwjvZt7y3ghF3sh/iX0qNko3T9W8im6R07hy0cPQBlijFUGhYi4z1ZIJ0rWlf/
	o2xLEn3/Z1phbn9oad0/xO8a4att0no=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-L5hhKF00Nr2yYQ64LJ-Qcw-1; Thu, 23 Apr 2020 09:59:43 -0400
X-MC-Unique: L5hhKF00Nr2yYQ64LJ-Qcw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95F0D872FFC;
	Thu, 23 Apr 2020 13:59:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DE805D714;
	Thu, 23 Apr 2020 13:59:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C5EEB1809542;
	Thu, 23 Apr 2020 13:59:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03NDx4rC004517 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 23 Apr 2020 09:59:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C7AEB112132E; Thu, 23 Apr 2020 13:59:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3AFD112132D
	for <dm-devel@redhat.com>; Thu, 23 Apr 2020 13:59:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7881805B9E
	for <dm-devel@redhat.com>; Thu, 23 Apr 2020 13:59:00 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-98-H7HcrlSgNv-jbPjMCxvU8g-1;
	Thu, 23 Apr 2020 09:58:56 -0400
X-MC-Unique: H7HcrlSgNv-jbPjMCxvU8g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 75654AC44;
	Thu, 23 Apr 2020 13:58:52 +0000 (UTC)
Message-ID: <afac68664b44a28203325fed2fee7d8c0d9ae750.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Gioh Kim <gi-oh.kim@cloud.ionos.com>
Date: Thu, 23 Apr 2020 15:58:51 +0200
In-Reply-To: <CAJX1YtYw+aJ5xXjZKoksF9gh3aaJoQRiqAkjUigc5R0-bFPb1w@mail.gmail.com>
References: <CAJX1YtZiGXdZTrGtw8ksP3khRf26jQ7dhBWoEJcGfQQZMGb-gg@mail.gmail.com>
	<086d3e2baae71658539ac7caf634336ea0927c04.camel@suse.com>
	<CAJX1YtaKhjLNN56rvwAXh7tOP1Egbo1izmFn3OUEhD4c489E1w@mail.gmail.com>
	<3dbafeb000d558af21db70816130573106b56a9c.camel@suse.com>
	<CAJX1YtYw+aJ5xXjZKoksF9gh3aaJoQRiqAkjUigc5R0-bFPb1w@mail.gmail.com>
User-Agent: Evolution 3.34.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03NDx4rC004517
X-loop: dm-devel@redhat.com
Cc: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>, Jinpu, dm-devel@redhat.com,
	Wang <jinpu.wang@cloud.ionos.com>
Subject: Re: [dm-devel] 'multipath add path' returns ok but the path is
 missing in the topology
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-04-23 at 13:50 +0200, Gioh Kim wrote:
> Hi Martin,
> 
> On Wed, Apr 22, 2020 at 5:40 PM Martin Wilck <mwilck@suse.com> wrote:
> > On Wed, 2020-04-22 at 16:00 +0200, Gioh Kim wrote:
> > > One question.
> > > Is it possible for multipathd to generate an event for removing a
> > > map?
> > > I am looking into the source code, ev_add_path and some functions
> > > related to add a path,
> > > but it looks like it does not generate any event.
> > 
> > I guess you mean an uevent. These events are created by the kernel
> > when
> > multipath creates or reloads maps. multipathd normally doesn't
> > trigger
> > the events directly.  But there are some cases where multipathd
> > basically runs the equivalent of "udevadm trigger -c change" on
> > either
> > maps or paths. Search the code for "trigger" for details.
> > 
> > There are also device mapper events which are created by the kernel
> > for
> > certain state changes of dm devices. Again, multipathd only
> > receives
> > such events.
> > 
> > Regards
> > Martin
> > 
> > 
> > 
> 
> I am making an environment to capture log for uevent as you said.
> 
> Meanwhile I found something weird: "orphan path, waiting for create
> to
> complete" what is this message?
> I guess the second added path was not registered when I executed
> "multipathd add path" at this moment.

True. "orphan" means that you added a path that didn't belong to a map.

Again, your multipathd seems to be configured such that maps aren't
created automatically ("find_multipaths strict"). I'm not sure whether
that makes a lot of sense in your setup, the way you describe it.
With "find_multipaths smart" or "find_multipaths greedy", your new maps
would be added without admin intervention.

> 
> I guess there would be some time delay for the second path to be
> included in the topology.
> Am I right?
> If I am right, could I make "multipathd add path" return only after
> everything is completely finished?

What is "everything"? how would multipathd know that you intend to add
another path? As I said previousl, you'd probably be better off using
"multipath -a $WWID", which would add the new WWID to the WWIDs file,
which controls multipathd's operation in "find_multipaths strict" mode.

> Apr 23 11:38:25 ib1 multipathd[2132]: sdc: open node: /dev/sdc
> Apr 23 11:38:25 ib1 multipathd[2132]: sdc: domap with mpp->action=6
> Apr 23 11:38:25 ib1 multipathd[2132]:
> 360000000000000000000000000000000: load table [0 204800 multipath 1

This WWID looks very fishy to me. Especially when you add or remove
paths dynamically, be sure to use unique WWIDs.

Regards
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

