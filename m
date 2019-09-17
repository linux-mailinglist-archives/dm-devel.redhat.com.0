Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D07B4F79
	for <lists+dm-devel@lfdr.de>; Tue, 17 Sep 2019 15:39:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 21CBBC049D59;
	Tue, 17 Sep 2019 13:39:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14CD060167;
	Tue, 17 Sep 2019 13:39:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AFEDA18005A0;
	Tue, 17 Sep 2019 13:39:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8HDdBv1001643 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 17 Sep 2019 09:39:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 516D45D9DC; Tue, 17 Sep 2019 13:39:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2225F5D9D5;
	Tue, 17 Sep 2019 13:39:04 +0000 (UTC)
Date: Tue, 17 Sep 2019 09:39:03 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20190917133903.GA3612@redhat.com>
References: <alpine.LRH.2.02.1909160553360.11421@file01.intranet.prod.int.rdu2.redhat.com>
	<20190916180107.GA725@infradead.org>
	<127b8c4e-a6dc-6d5e-caff-fe1a0ca3a5bb@gmail.com>
	<20190917063242.GA10776@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190917063242.GA10776@infradead.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Milan Broz <gmazyland@gmail.com>, lvm-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 17 Sep 2019 13:39:49 +0000 (UTC)

On Tue, Sep 17 2019 at  2:32am -0400,
Christoph Hellwig <hch@infradead.org> wrote:

> On Mon, Sep 16, 2019 at 08:16:41PM +0200, Milan Broz wrote:
> > 
> > So the main idea behind this was just use already existing functionality
> > in kernel DM, and provide simple user-friendly way to detect some incompatibilites
> > more early. If detection is not there, we just fallback to the old way.
> 
> Well, and the nice way to do that is to actually report the features,
> not some arbitrary version number.  That is have a sysfs file (or
> ioctl for dm if that is the way to go) that reports a list of
> capabilities.  Then userspace checks for that desired capability and
> only tries the feture if it is supported.

A target's version, while opaque and imperfect, has served DM pretty
well for a long time.  Requires discipline when backporting changes but
stable@ version bumps generally don't occur because such a bump triggers
conflicts across the N stable@ kernels.

So I'm not opposed to fined grained reporting of target features.  But
doing so can come later.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
