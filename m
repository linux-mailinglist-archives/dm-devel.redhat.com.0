Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 55D653D6377
	for <lists+dm-devel@lfdr.de>; Mon, 26 Jul 2021 18:29:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627316949;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Hfxkh3PFamUMD5+KWfIlG+5cDOQT2SLp0TjEarXlMqI=;
	b=bYPXuicxFtCejE9Bx7SfuCmTE4z/86nB32yGzomdps2RoBYjb+XrHGTe1bawrX9Q5Pimkl
	HOpSbJUBYfp5qAppVIQnRsk75TdHa3V3dMkSzl5VcMKnE+TmUZTLEQZX5uzbAcZo+2+n6H
	MPz4jFoXjyp9oarL2WCGxjWMd2qFkgc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-Y_YxO4hSM3mmB557IuE2zg-1; Mon, 26 Jul 2021 12:29:07 -0400
X-MC-Unique: Y_YxO4hSM3mmB557IuE2zg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B684F1008060;
	Mon, 26 Jul 2021 16:29:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5A8E10016F8;
	Mon, 26 Jul 2021 16:28:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 037EE180B7A2;
	Mon, 26 Jul 2021 16:28:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16QGSZiG016308 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 26 Jul 2021 12:28:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0DA2A19811; Mon, 26 Jul 2021 16:28:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCB6E179B3;
	Mon, 26 Jul 2021 16:28:29 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 16QGSSaV024130; 
	Mon, 26 Jul 2021 11:28:28 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 16QGSRth024129;
	Mon, 26 Jul 2021 11:28:27 -0500
Date: Mon, 26 Jul 2021 11:28:27 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <20210726162827.GH3087@octiron.msp.redhat.com>
References: <37767722-8e6c-4176-d234-87134c21cd4c@huawei.com>
	<20210722214253.GC3087@octiron.msp.redhat.com>
	<85cb30a7-a873-b33d-4105-6e3e9675f105@huawei.com>
	<20210723165603.GE3087@octiron.msp.redhat.com>
	<02cba2a5-3fcf-bca9-d887-f8a3c0300582@huawei.com>
MIME-Version: 1.0
In-Reply-To: <02cba2a5-3fcf-bca9-d887-f8a3c0300582@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [Question] multipathd.service start failed when
 /var/run isn't mount
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 26, 2021 at 08:22:49PM +0800, lixiaokeng wrote:
> 
> >> After sdb mounted to /var, we can start multipathd service successfully.
> > 
> > But when the binaries were compiled, if /var/run existed and was a
> > symlink in your build environment, then RUN should equal "run", and
> > multipath should should be using /run instead of /var/run, right?
> > 
> > This is why I asked what multipath packages are you using.
> > 
> This problem is found in 0.7.7.

Sorry. I wasn't very clear with what I was asking for.  Unless I'm
missing something here, if multipathd is trying to use /var/run, that
means that when the multipathd binary was compiled, it was compiled on a
machine where /var/run was not a symlink. 

So, I'm wondering where your multipathd binary got compiled. Are you
using a packaged version from a distribution like RHEL, SLES, Fedora,
Ubuntu, etc? Did you compile it yourself?

When I run multipathd under strace, I can see:

openat(AT_FDCWD, "/run/multipathd.pid", O_WRONLY|O_CREAT, 0644) = 3

The multipathd binary I'm using was compiled on a machine where /var/run
is a symlink to /run, so multipathd directly uses /run, instead of using
/var/run. I'm assuming that whatever machine your multipathd binary was
compiled on, /var/run was a directory. Do you know if that's possible?

-Ben

> 
> Regards, Lixiaokeng

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

