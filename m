Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B93D9743F27
	for <lists+dm-devel@lfdr.de>; Fri, 30 Jun 2023 17:47:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688140075;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rFcmsymbKZ7tEzFHX83AFI67wW4+BwnTtfA4gvw8wio=;
	b=bZ2u/NCFpokQLDeR+8HE1bTR5F7isxgon9/f2eh0GHiiWfl/0EwQI2LalWVbBAo67MY37g
	J2VtB6rZTWNrbpvwrU5VFKgz5T3kry3MnEJ0uqCA5r4WtRX+eq4DnvKhR2xONsRE68/QLQ
	OdLEieR86xL/M4r001eFkaFB+Au2Ldw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-YhTfefXxN5iSn-UpcuTbrQ-1; Fri, 30 Jun 2023 11:47:50 -0400
X-MC-Unique: YhTfefXxN5iSn-UpcuTbrQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCE118564EF;
	Fri, 30 Jun 2023 15:47:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 556B514682FA;
	Fri, 30 Jun 2023 15:47:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EF6AB1946A61;
	Fri, 30 Jun 2023 15:47:21 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 37D8F19465B3
 for <dm-devel@listman.corp.redhat.com>; Fri, 30 Jun 2023 15:46:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 14FBDF5CEC; Fri, 30 Jun 2023 15:46:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE748F6416;
 Fri, 30 Jun 2023 15:46:56 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 35UFkrli007409;
 Fri, 30 Jun 2023 10:46:53 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 35UFkqxb007408;
 Fri, 30 Jun 2023 10:46:52 -0500
Date: Fri, 30 Jun 2023 10:46:52 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20230630154652.GK32239@octiron.msp.redhat.com>
References: <CD5EC3B3-9A64-416A-A04C-C68EDB82F4C6@purestorage.com>
 <a85c4b5a6603be979ddb9aa0909808519a03fa3e.camel@suse.com>
 <20230320194146.GH19878@octiron.msp.redhat.com>
 <e19fd16143ae04c631f2e6eb6a55b2604876f9f2.camel@suse.com>
 <f2aa7310447494294a0e274e9966ab6febb99b34.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <f2aa7310447494294a0e274e9966ab6febb99b34.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [dm-devel] [PATCH] multipath-tools Consider making 'smart' the
 default
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: device-mapper development <dm-devel@redhat.com>,
 Xose Vazquez Perez <xose.vazquez@gmail.com>,
 Brian Bunker <brian@purestorage.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 26, 2023 at 03:11:30PM +0200, Martin Wilck wrote:
> On Tue, 2023-03-21 at 09:57 +0100, Martin Wilck wrote:
> > On Mon, 2023-03-20 at 14:41 -0500, Benjamin Marzinski wrote:
> > > On Mon, Mar 20, 2023 at 03:18:37PM +0100, Martin Wilck wrote:
> > > > On Thu, 2023-03-16 at 14:47 -0700, Brian Bunker wrote:
> > > > > 
> > 
> > > > > Subsequent volumes after the first one are discovered via unit
> > > > > attentions triggering the udev rule which calls scan-scsi-
> > > > > target.
> > > > > The SCSI devices being discovered without creating the
> > > > > corresponding
> > > > > multipath devices seems to be a bad default. We would like to
> > > > > control as much as possible from the target side to dictate
> > > > > initiator
> > > > > behavior. This comes as a regression to how it previously
> > > > > worked.
> > > > > 
> > > > > Signed-off-by: Brian Bunker <brian@purestorage.com>
> > > > 
> > > > I'm fine with this, but keep in mind that distributions will
> > > > probably
> > > > override this anyway. Red Hat and SUSE have had different
> > > > defaults
> > > > for
> > > > this basically forever. At least enterprise distros won't risk
> > > > regressions because of changing defaults.
> > > > 
> > > > Ben, what's your opinion wrt the patch?
> > > 
> > > tl;dr: I think "yes" makes more sense than "smart".
> > 
> > TL;DR: I'd like to hear the "voice of the user" at this point. So if
> > anyone except Ben, Brian, and myself has read this far, please speak
> > up
> > (and read on if you have the patience)!
> > 
> 
> Well, nobody has spoken up for 3 months.
> 
> Reconsidering the past discussion, I think we shouldn't change this
> default. As argued previously, I believe that the majority of multipath
> users install some distribution package. Distros either change the
> default by patching (like SUSE and Red Hat) or keep the upstream
> default. The first class of distros won't change their defaults, so for
> them it's just extra work (modifying the downstream patches) without
> user benefit. For the second class of distros, changing the upstream
> default would cause an unexpected change in behavior for end users.
> People who compile the upstream code themselves should have the
> knowledge to set the default to suit their needs.
> 
> Thoughts? Disagreement?

I think leaving it alone makes sense.
-Ben


> 
> Martin
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

