Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C69F1B51A8
	for <lists+dm-devel@lfdr.de>; Tue, 17 Sep 2019 17:39:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B21F9369D3;
	Tue, 17 Sep 2019 15:39:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D9EB60BEC;
	Tue, 17 Sep 2019 15:38:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 412A24EE69;
	Tue, 17 Sep 2019 15:38:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8HFcjbJ011522 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 17 Sep 2019 11:38:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C082260BF7; Tue, 17 Sep 2019 15:38:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 184FF60BEC;
	Tue, 17 Sep 2019 15:38:35 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x8HFcYMG003380; Tue, 17 Sep 2019 11:38:34 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x8HFcXck003376; Tue, 17 Sep 2019 11:38:33 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 17 Sep 2019 11:38:33 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <20190917140632.GA3728@redhat.com>
Message-ID: <alpine.LRH.2.02.1909171133100.1876@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1909160553360.11421@file01.intranet.prod.int.rdu2.redhat.com>
	<20190916180107.GA725@infradead.org>
	<127b8c4e-a6dc-6d5e-caff-fe1a0ca3a5bb@gmail.com>
	<CAMeeMh9t4LBwJn_CPQgFNa_Tyj22fJYHK-4qAnyn0RXm9RzCnw@mail.gmail.com>
	<20190917140632.GA3728@redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: John Dorminy <jdorminy@redhat.com>, lvm-devel@redhat.com,
	Christoph Hellwig <hch@infradead.org>,
	device-mapper development <dm-devel@redhat.com>,
	Zdenek Kabelac <zkabelac@redhat.com>, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] dm: introduce DM_GET_TARGET_VERSION
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Tue, 17 Sep 2019 15:39:03 +0000 (UTC)



On Tue, 17 Sep 2019, Mike Snitzer wrote:

> On Tue, Sep 17 2019 at  9:56am -0400,
> John Dorminy <jdorminy@redhat.com> wrote:
> 
> >    I'm confused here:
> 
> >    >...and then it fails on activation because DM table load detects old (or
> >    missing) dm-crypt feature.
> >    >(There was no way to get dm target version before table load if module is
> >    not loaded.)
> >    >And I tried to avoid modprobe calls from libcryptsetup.
> > 
> >    I'm not understanding how this could work. Let's say there's a module
> >    providing target 'splice' which is currently unloaded. Then `dmsetup
> >    target-version splice` is unaware of the splice target, and thus reports
> >    nothing. So in order to get the proper version number, we do have to do a
> >    modprobe first.
> >    But, if the module providing splice *is* already loaded, `dmsetup targets`
> >    will report splice's version number already, so `dmsetup target-version
> >    splice` is a convenience instead of parsing `dmsetup targets` output?
> 
> dm_get_target_type() loads the requested module.  No userspace modprobe
> needed.

The reason why Milan wanted it is - that it is bad practice to call 
external processes from libraries. He doesn't want to call modprobe from 
libcryptsetup. So I created this patch that calls modprobe from the kernel 
ioctl.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
