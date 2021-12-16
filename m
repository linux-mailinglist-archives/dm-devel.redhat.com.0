Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CCB47760A
	for <lists+dm-devel@lfdr.de>; Thu, 16 Dec 2021 16:35:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639668906;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kVso3cLD7N6P6WGOYiEaba75ppB/qEfJ3tlizpdWGdM=;
	b=Wa2nx0S+oZk04HzvxyWjA2Bo46PhSNEKv34Dbm91FctrXFt2iaHvhfJbdUcB4AJI5u9D7x
	sZRCaH68/c8eiUAMFC2yNoMG4j07wI94udbZdcSOlyz2IMfWhWNnrlrCx68ZC08SqYQIvR
	2mzXfgiLAbP0mbovs7OhxTb27p1dL8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-NK9Bfw0EOeehLJ7q9KSKow-1; Thu, 16 Dec 2021 10:35:05 -0500
X-MC-Unique: NK9Bfw0EOeehLJ7q9KSKow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 870FE83DCCF;
	Thu, 16 Dec 2021 15:34:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7ED45ED3C;
	Thu, 16 Dec 2021 15:34:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 354524BB7C;
	Thu, 16 Dec 2021 15:34:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BGFYP4d002967 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Dec 2021 10:34:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4F73C45D91; Thu, 16 Dec 2021 15:34:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F2DD45D8A;
	Thu, 16 Dec 2021 15:34:12 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1BGFY9Gq018643; 
	Thu, 16 Dec 2021 09:34:09 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1BGFY8Yc018642;
	Thu, 16 Dec 2021 09:34:08 -0600
Date: Thu, 16 Dec 2021 09:34:07 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20211216153407.GD19591@octiron.msp.redhat.com>
References: <20211124204118.GP19591@octiron.msp.redhat.com>
	<52ddff9a6d2b1813d1269a008eb92ee522c3d6ad.camel@suse.com>
	<20211129192729.GD19591@octiron.msp.redhat.com>
	<d9260ceb655395864041a5037bac5aab6f722cf0.camel@suse.com>
	<20211130165251.GK19591@octiron.msp.redhat.com>
	<c6893070dd0d70420104ed071f7f45a365bd7faf.camel@suse.com>
	<1e0efe64215f399ca2f248590b48b4ec5024d8ed.camel@suse.com>
	<20211214232526.GB19591@octiron.msp.redhat.com>
	<00f998ccfd2ee9893b27e4eb536fa26c59608e8b.camel@suse.com>
	<bcabbd3ebf3edbd8245f91baf90f6dbaa5df7d36.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <bcabbd3ebf3edbd8245f91baf90f6dbaa5df7d36.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Chongyun Wu <wu.chongyun@h3c.com>
Subject: Re: [dm-devel] [PATCH v2 03/48] libmultipath: add optional wakeup
 functionality to lock.c
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 15, 2021 at 10:01:34PM +0100, Martin Wilck wrote:
> Hi Ben,
> 
> On Wed, 2021-12-15 at 08:33 +0100, Martin Wilck wrote:
> > 
> > I just wanted to say that my previous argument that addition or
> > removal
> > of symbols can be ignored was wrong, and that we should keep the
> > treatment of minor versions as originally designed. I am fine with us
> > not touching the .version files while we work on new patch sets, and
> > leaving it to the person perparing a PR for Christope (likely myself)
> > to fix it up when a patch series is finished. In practice, it'll
> > probably result in just a major version bump per submission to
> > Christophe, but that isn't cast in stone (if we submit a smaller set
> > of
> > patches, it might be just a minor bump, or none at all).
> > 
> > Distros are free to modify the last digit as they please.
> 
> Here's what I think I should do: I'll keep one patch on top of the
> "queue" branch that includes the necessary ABI bumps. I'll fix this
> patch up as commits are added to "queue". This means the queue branch
> (more precisely, the topmost commit) will need to be rebased. It won't
> be a problem as this commit will only touch the .version files, nothing
> else. This way builds from "queue" will be "safe" against library
> incompatibilities wrt the official release, and yet we won't need to
> bump the major version multiple times for a single submission to
> Christophe. Submissions to Christophe will come with either no bump, or
> a single-step minor bump, or a single-step major bump.
> 
> Does this make sense?
> 
Sure. I'm fine with that.

-Ben

> Regards
> Martin

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

