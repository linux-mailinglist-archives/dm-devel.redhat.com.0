Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5892296955
	for <lists+dm-devel@lfdr.de>; Tue, 20 Aug 2019 21:25:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 86A89308427D;
	Tue, 20 Aug 2019 19:25:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D69A41001959;
	Tue, 20 Aug 2019 19:25:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC1F32551C;
	Tue, 20 Aug 2019 19:25:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7KJOp2g007056 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 20 Aug 2019 15:24:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3586F1B5B9; Tue, 20 Aug 2019 19:24:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7802622700;
	Tue, 20 Aug 2019 19:24:48 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x7KJOlVi014281; 
	Tue, 20 Aug 2019 14:24:47 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x7KJOknS014280;
	Tue, 20 Aug 2019 14:24:46 -0500
Date: Tue, 20 Aug 2019 14:24:46 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20190820192446.GM25414@octiron.msp.redhat.com>
References: <20190815144638.5664-1-martin.wilck@suse.com>
	<20190815144638.5664-2-martin.wilck@suse.com>
	<20190816201218.GF25414@octiron.msp.redhat.com>
	<da712bc269003e39dd35e8d7799992ff1d650c6a.camel@suse.com>
	<3913aa7aa45297995fc8776bc7d4496ef9fbe3f8.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3913aa7aa45297995fc8776bc7d4496ef9fbe3f8.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/2] multipath.conf: add "enable_foreign"
 parameter
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Tue, 20 Aug 2019 19:25:22 +0000 (UTC)

On Tue, Aug 20, 2019 at 04:24:58PM +0000, Martin Wilck wrote:
> On Mon, 2019-08-19 at 20:32 +0000, Martin Wilck wrote:
> > On Fri, 2019-08-16 at 15:12 -0500, Benjamin Marzinski wrote:
> > > On Thu, Aug 15, 2019 at 02:46:54PM +0000, Martin Wilck wrote:
> > > > From: Martin Wilck <mwilck@suse.com>
> > > > 
> > > > This new configuration parameter can be used to selectively
> > > > enable foreign libraries. The value is a regular expression,
> > > > against which foreign library names such as "nvme" are matched.
> > > > By setting this to a value that matches no foreign library
> > > > (e.g. "^$" or "NONE"), foreign code is completely disabled.
> > > > By default, all available foreign libraries are loaded.
> > > > 
> > > 
> > > This will stop the foreign libraries from even claiming devices.
> > > Won't
> > > this mean that pathinfo() will now treat these devices as
> > > multipathable
> > > paths, since is_claimed_by_foreign() will return false? 
> > 
> > IMO this won't happen, because we ignore the native multipath path
> > devices anyway as they're "hidden", and we ignore native NVMe
> > multipath
> > maps because they have "nvme-subsystem" subsystem rather than "nvme"
> > (commit b18ed66). But I'll double-check again.
> 
> Confirmed. With nvme_core.multipath=Y and the nvme library disabled,no
> NVMe-related output is printed.
> 
> Ben, with that in mind, would you ACK this patch?

Sure. Sorry about the confusion

Reviewed-by: Benjamin Marzinksi <bmarzins@redhat.com>
 
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
