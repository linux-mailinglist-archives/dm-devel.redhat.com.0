Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5A29526F723
	for <lists+dm-devel@lfdr.de>; Fri, 18 Sep 2020 09:37:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-8SGlugwJPgyDIc4mvWO4uw-1; Fri, 18 Sep 2020 03:37:43 -0400
X-MC-Unique: 8SGlugwJPgyDIc4mvWO4uw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25DA8100747C;
	Fri, 18 Sep 2020 07:37:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE86D19930;
	Fri, 18 Sep 2020 07:37:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A0AFA44A77;
	Fri, 18 Sep 2020 07:37:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08I7bVne022359 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Sep 2020 03:37:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8E21B2028DCC; Fri, 18 Sep 2020 07:37:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89985200A4F3
	for <dm-devel@redhat.com>; Fri, 18 Sep 2020 07:37:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 564AD101AA42
	for <dm-devel@redhat.com>; Fri, 18 Sep 2020 07:37:29 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-217-Etw9x6SXNaaOXVeHQO2BmQ-1;
	Fri, 18 Sep 2020 03:37:24 -0400
X-MC-Unique: Etw9x6SXNaaOXVeHQO2BmQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1DB64ADD9;
	Fri, 18 Sep 2020 07:37:57 +0000 (UTC)
Message-ID: <011310221c816f3c3573d96d91aca3e0a48fb80d.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, lixiaokeng
	<lixiaokeng@huawei.com>
Date: Fri, 18 Sep 2020 09:37:22 +0200
In-Reply-To: <20200918022626.GU11108@octiron.msp.redhat.com>
References: <d89bc33d-8e5d-d194-3b26-83ff4d170c5c@huawei.com>
	<20200918022626.GU11108@octiron.msp.redhat.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: dm-devel, list <dm-devel@redhat.com>, linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 0/6] libmultipath: check udev* func return
	value
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-09-17 at 21:26 -0500, Benjamin Marzinski wrote:
> On Tue, Sep 15, 2020 at 12:38:27PM +0800, lixiaokeng wrote:
> > Hi,
> >   The udev* function may return NULL,and it will be
> > dereferenced in str* and sscanf func. For example,
> > there is a coredump caused in add func, which show in
> > be7a043(commit id) in upstream-queue. We check the
> > return value to avoid dereference NULL.
> > 
> > repo: openSUSE/multipath-tools
> > repo link: https://github.com/openSUSE/multipath-tools
> > branch: upstream-queue
> > 
> For the set
> Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

Well, the set got the logic wrong in 3 out of 6 patches :-)

In general, as these fixes are all very similar, I would prefer
bundling them together into one patch, and I would like to make sure
(and assert in the commit message) that the set fixes
*all* possible NULL pointer dereferences related to accessing udev
properties (I haven't checked whether this is the case for the set).

Also, while I'd ack this set if the logic was correct, I think that in
a way it's papering over the actual problem. udev_device_get_XYZ()
functions fail *only* if the underlying sysfs directory has vanished
(well, perhaps for out-of-memory, too, but let's put that aside for a
moment). It that case, we should actually not just return an error code
- we should realize that there's a problem with the device (it probably
has been deleted from the system and shouldn't be used any more in any
way), and that we need to deal with it somehow. This is a fundamental
problem for all user space programs that use udev_devices for more than
a few CPU cycles. That doesn't mean the set is wrong, but we should
keep this in mind. I have something cooking for a more complete
solution, which isn't ready yet.

Finally, @lixiaokeng, please check your inbox once more. You still
haven't fixed #11/14 of your previous series.

Regards,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

