Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9A35F1B3C68
	for <lists+dm-devel@lfdr.de>; Wed, 22 Apr 2020 12:06:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587549963;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1ricZ45RzVqmeiuqQgf8YrUP3meelu/p3q5dJDBLWqk=;
	b=NEJiRVANd4DIC/T1iO6QxIO9qBgDeqWZ1mkmhImnld1F/ZFbYTDs5IoJl7U0hjmpqYPKAB
	XVCTGtKgKzBtQL5HmtLIxWKNxdaoCpkV6Ek9f5ms3BW3f0vTQSfzfTBsMXQqKr75wa7pnd
	LesNtvHV3HhmI1U1cKXhlTXq7zB/R8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-UpdqgoecNpOzjnBYMw58Sg-1; Wed, 22 Apr 2020 06:06:01 -0400
X-MC-Unique: UpdqgoecNpOzjnBYMw58Sg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93EC2190B2A0;
	Wed, 22 Apr 2020 10:05:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 589C11009940;
	Wed, 22 Apr 2020 10:05:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55FBE941C3;
	Wed, 22 Apr 2020 10:05:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03MA5MBB022026 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Apr 2020 06:05:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8C3452026FFE; Wed, 22 Apr 2020 10:05:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 886292026D66
	for <dm-devel@redhat.com>; Wed, 22 Apr 2020 10:05:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 478B0185A78E
	for <dm-devel@redhat.com>; Wed, 22 Apr 2020 10:05:19 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-42--jUkY6mHP52EGD659nVLjA-1;
	Wed, 22 Apr 2020 06:05:15 -0400
X-MC-Unique: -jUkY6mHP52EGD659nVLjA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 0BDFAAC19;
	Wed, 22 Apr 2020 10:05:12 +0000 (UTC)
Message-ID: <086d3e2baae71658539ac7caf634336ea0927c04.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Gioh Kim <gi-oh.kim@cloud.ionos.com>, dm-devel@redhat.com,
	christophe.varoqui@opensvc.com
Date: Wed, 22 Apr 2020 12:05:12 +0200
In-Reply-To: <CAJX1YtZiGXdZTrGtw8ksP3khRf26jQ7dhBWoEJcGfQQZMGb-gg@mail.gmail.com>
References: <CAJX1YtZiGXdZTrGtw8ksP3khRf26jQ7dhBWoEJcGfQQZMGb-gg@mail.gmail.com>
User-Agent: Evolution 3.34.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03MA5MBB022026
X-loop: dm-devel@redhat.com
Cc: Jinpu Wang <jinpu.wang@cloud.ionos.com>,
	Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Gioh,

On Wed, 2020-04-22 at 10:40 +0200, Gioh Kim wrote:
> Hi,
> 
> I would like to report a bug.
> I am using network storage via SRP/SRPT over Infiniband.
> When a new sd device is created by SRP, I execute 'multipathd add
> path
> sdX' command and then a new map device is created automatically.
> 
> I used to use the kernel 4.14 version and had no problem.
> But after upgrading to kernel 4.19, I have a problem that 'multipath
> add path sdX' returns ok but sdX is not included in the topology.
> 
> For example, I ran 'multipath add path sdaj' and 'multipath add path
> sdak' and they returned ok.
> Then I check the topology with 'multipathd show topology' and sdak is
> missing.
> 
> Following is the log message from multipathd daemon.
> I found that
> 1. adding sdaj was done correctly and map
> 3600144f033337cfc3ca5222200196002 and dm-11 was created
> 2. daemon started adding sdak (according to "sdak: add path
> (operator)" message)
> 3. suddenly map dm-11 was removed and created
> 4. adding sdak returned ok but there was no "sdak: path added to
> devmap .." message.  I waited some minutes but it did not show up.
> I guess there would be some corner case for error handling.
> The multipathd might have an error but not return an error.
> 
> 
> <log message>
> multipathd[1920]: sdaj: add path (operator)
> multipathd[1920]: 3600144f033337cfc3ca5222200196002: load table [0
> 2105344 multipath 1 retain_attached_hw_handler 0 1 1 service-time 0 1
> 1 66:48 1]
> multipathd[1920]: 3600144f033337cfc3ca5222200196002: event checker
> started
> multipathd[1920]: sdaj [66:48]: path added to devmap
> 3600144f033337cfc3ca5222200196002
> multipathd[1920]: sdak: add path (operator)
> multipathd[1920]: dm-11: remove map (uevent)
> multipathd[1920]: 3600144f033337cfc3ca5222200196002: stop event
> checker thread (139976177456896)
> multipathd[1920]: dm-11: remove map (uevent)
> multipathd[1920]: 3600144f033337cfc3ca5222200196002: adding map
> multipathd[1920]: 3600144f033337cfc3ca5222200196002: event checker
> started
> multipathd[1920]: 3600144f033337cfc3ca5222200196002: devmap dm-11
> registered
> 
> <multipathd show topology>
> 3600144f033337cfc3ca5222200196002 dm-11 SCST_BIO,e21f6f605c1dfff7
> size=1.0G features='1 retain_attached_hw_handler' hwhandler='0' wp=ro
> `-+- policy='service-time 0' prio=1 status=enabled
> `- 7:0:0:489 sdaj 66:48  active ready running
> 

These logs indicate that multipathd actually successfully added sdak to
the map, so the success return status was correct. The logs provide no
clue why the map was removed and re-added. multipathd seems to have had
just a passive role here. We would need the kernel and udev logs
(udev.log-priority=debug) to see what's actually going on. Also, please
provide your multipath configuration and the version of multipath-tools 
you're using, and logs extending over a long period of time (at least
covering the addition of the new paths).

I'd expect new paths to be added to maps automatically, but that
doesn't seem to happen in your configuration. Are you using
"find_multipaths=strict"? In that case, you should rather use
"multipathd add map "$wwid", or, even better "multipath -a $WWID".

Regards
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

