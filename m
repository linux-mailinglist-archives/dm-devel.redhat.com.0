Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AC256B3C72
	for <lists+dm-devel@lfdr.de>; Mon, 16 Sep 2019 16:21:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C2F310CC1F2;
	Mon, 16 Sep 2019 14:21:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A291760600;
	Mon, 16 Sep 2019 14:21:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D5660180085A;
	Mon, 16 Sep 2019 14:21:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8GELCPl001186 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 16 Sep 2019 10:21:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E17F15D9E1; Mon, 16 Sep 2019 14:21:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E94FE5D9DC;
	Mon, 16 Sep 2019 14:21:07 +0000 (UTC)
Date: Mon, 16 Sep 2019 10:21:07 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20190916142106.GA30565@redhat.com>
References: <alpine.LRH.2.02.1909160553360.11421@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.1909160553360.11421@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>,
	lvm-devel@redhat.com, Milan Broz <mbroz@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]); Mon, 16 Sep 2019 14:21:37 +0000 (UTC)

On Mon, Sep 16 2019 at  5:55am -0400,
Mikulas Patocka <mpatocka@redhat.com> wrote:

> This patch introduces a new ioctl DM_GET_TARGET_VERSION. It will load a
> target that is specified in the "name" entry in the parameter structure
> and return its version.
> 
> This functionality is intended to be used by cryptsetup, so that it can
> query kernel capabilities before activating the device.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

I've picked this up for 5.4, last change now that merge window is open,
thanks.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
