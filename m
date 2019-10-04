Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 14749CC23B
	for <lists+dm-devel@lfdr.de>; Fri,  4 Oct 2019 19:58:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 123DD18C4295;
	Fri,  4 Oct 2019 17:58:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A21525D6B7;
	Fri,  4 Oct 2019 17:58:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9CB9E4E589;
	Fri,  4 Oct 2019 17:58:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x94HqQUQ006521 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Oct 2019 13:52:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 62E1010018FF; Fri,  4 Oct 2019 17:52:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7150810018F8;
	Fri,  4 Oct 2019 17:52:23 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x94HqMFe005201; 
	Fri, 4 Oct 2019 12:52:22 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x94HqL50005200;
	Fri, 4 Oct 2019 12:52:21 -0500
Date: Fri, 4 Oct 2019 12:52:21 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20191004175221.GG25414@octiron.msp.redhat.com>
References: <e2b955d0-69ea-2c2b-9f0f-ccf3b5f369d0@gmail.com>
	<20191003214420.GE25414@octiron.msp.redhat.com>
	<5d38873e4ea51f00d1d49e9e9fb86419542598e8.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d38873e4ea51f00d1d49e9e9fb86419542598e8.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"xose.vazquez@gmail.com" <xose.vazquez@gmail.com>,
	Hannes Reinecke <hare@suse.com>
Subject: Re: [dm-devel] multipath-tools: RH-patches for upstream ???
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]); Fri, 04 Oct 2019 17:58:53 +0000 (UTC)

On Fri, Oct 04, 2019 at 07:03:26AM +0000, Martin Wilck wrote:
> Hi Xose, hi Ben,
> 
> On Thu, 2019-10-03 at 16:44 -0500, Benjamin Marzinski wrote:
> > On Thu, Oct 03, 2019 at 08:28:06PM +0200, Xose Vazquez Perez wrote:
> > 
> > Redhat doesn't include the udev rules file that sets ID_SCSI_VPD, so
> > there are some rare cases where this property blacklists valid
> > devices.
> > Thus, it's easier for us to simply include this property line in the
> > default multipath.conf, and let users remove it if necessary. I would
> > be
> > fine with this being included upstream, but I suspect it would mess
> > with
> > other ditsros which are currently assuming that it is there.
> 
> Hm. ID_SCSI_VPD is nowhere referenced in the upstream code. The default
> is "(SCSI_IDENT_|ID_WWN)", where SCSI_IDENT_ could be regarded as a
> SUSE-ism because the SCSI_IDENT_* properties are set by sg_inq / sg_vpd
> calls, and I'm not sure if other distros consequently use sg_inq rather
> than scs_id like we do. We (SUSE) have been working on replacing
> scsi_id by sg3_utils calls in upstream systemd, but so far that hasn't
> been merged, systemd maintainers are very cautious about touching these
> udev rules.

Sorry, I meant SCSI_IDENT_. The properties blacklist line originally was
(ID_SCSI_VPD|ID_WWN). I never bothered to update the commit message when
I changed this commit to deal with the new line.
 
> 
> I'd be interested in seeing an example for a device that is erroneously
> excluded by the default blacklist rule.

I'm not sure if there are any specific arrays that always fail to set
ID_WWN. I've gotten rare reports about this failing, but after I tell
them to not use that property blacklist line, they go away, and I never
get enough information to figure out what specifically is happening that
means that ID_WWN isn't getting set. It's something that I've been
meaning to look into, but with this patch, there's not much urgency
around it.
 
> > I posted this upstream and Hannes NAKed it a while back. We still
> > find
> > it useful, since the default multipath.conf file for Redhat sets
> > find_multipaths to yes. You can currently avoid the race that this is
> > fixing by setting find_multipaths to smart, but there were objections
> > to
> > using that as a default in Redhat. However, I never really understood
> > the objection to this patch, and I'd be fine with re-posting it.
> 
> https://www.redhat.com/archives/dm-devel/2014-July/msg00011.html
> 
> I'm with Hannes. Doing this in dracut, udev rules, or systemd service
> files seems cleaner to me than yet another daemon that tries to
> interpret the kernel command line.
> 
> See e.g. how we implemented multipath=off (cd3184e).

Yep. But again, this is already solveable now by running multipath with
find_multipaths=smart, so I'm not sure that there's a need for it
upstream at all.  If I rework this patch to something that would be
accpetable upstream, I'll post it, in case anyone is interested in it.  
 
-Ben

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
