Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE941550F2
	for <lists+dm-devel@lfdr.de>; Fri,  7 Feb 2020 04:19:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581045593;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/Jj/adqRzb8fHMAWWQC+ekZkbG0wX4sgVY/wwZkx7tY=;
	b=Kh6F2pMFegQfvkLs4uWr2wYi9Y2uXHXfWE3s0E/ujId3N6jnMhMQ/HnbvNcjeAwYbq6njK
	DcD7vdqGB1NEXQJVsZk3K03iUJwfhB170Uw/oFzjWPbf3vHEVCfxvv0Sl/pKDOgPcLpSJQ
	W31wNAu+7HGuKm8nbiY76SBliJ/kgww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-WefgzcZYOXe1K1tOD2Wg5w-1; Thu, 06 Feb 2020 22:19:51 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C6C110054E3;
	Fri,  7 Feb 2020 03:19:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD65660BEC;
	Fri,  7 Feb 2020 03:19:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 97E3A18089CD;
	Fri,  7 Feb 2020 03:19:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0173JHUm018251 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 6 Feb 2020 22:19:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AABAF2049CB5; Fri,  7 Feb 2020 03:19:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5C0D2049CA4
	for <dm-devel@redhat.com>; Fri,  7 Feb 2020 03:19:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 864D580027E
	for <dm-devel@redhat.com>; Fri,  7 Feb 2020 03:19:15 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
	[209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-373-eU-it6cPNDOuIvh3J0qBaw-1; Thu, 06 Feb 2020 22:19:13 -0500
Received: by mail-qt1-f199.google.com with SMTP id n4so745540qtv.5
	for <dm-devel@redhat.com>; Thu, 06 Feb 2020 19:19:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=f4Tc6bp55rY3GX1OICkOgmKwUX85CTPtc/RcSPrczU4=;
	b=GRyzoX5dOZhik0aAOog14jVmvkNVCuArp5ncwR3oWMuSnQoPfboeS3KwP8o2/egwiO
	vjjqePk3/2OjjE3RUR9BPrW4GkCRdd4wldvLaFh9/biRHVzjx8kdkUSzCV0fG6cbGUs1
	/ds60qkqUHInrE/h0lNO7XFahFQiEfXAjSMnBo0xOf5uHn46Ul1/JtR36YvfMEfEYvJQ
	bKwjTJWQK6x9XBZzPZGuSwRU9Hp2YPFGc4kSPhNzMR3+7UbDiuDXix4uFJvGJ3gyT1zi
	LW3Xjr3EHzuGGxnsd3QW8ydBK4uvwNkCBMUVDnbImyZ/iXsQETDJWjiLcFolksrDBqqR
	M0Yw==
X-Gm-Message-State: APjAAAXVdMZvw/yZPhuwgiEKbT9dKfn/fLGjehCa4LQAKygREaGDQGXV
	KjNYAQmipM6QSSr+1cMLe1ByfJanPfFZyhGMtMXwXyT66Gtu1JMJ/jKi/EGUQ3C01Ou0027RMJN
	dvI3wS8ZT3+WGn9QzpreXu/7ipPlG6bQ=
X-Received: by 2002:a05:620a:911:: with SMTP id
	v17mr5602131qkv.94.1581045553201; 
	Thu, 06 Feb 2020 19:19:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqxwsyWzdjhLmROFg10RBqd0bp0CgR75/kvDIigVFcGx36mRl3ZCN6/WnPxntA9REdL9p+cgVEUnQODvU0CPA1Q=
X-Received: by 2002:a05:620a:911:: with SMTP id
	v17mr5602123qkv.94.1581045552992; 
	Thu, 06 Feb 2020 19:19:12 -0800 (PST)
MIME-Version: 1.0
References: <20200201005524.23405-1-jdorminy@redhat.com>
	<20200203165402.GA11874@redhat.com>
	<CAMeeMh82tS6TZCLzMwW7Kk+wdnMFW8WXrbe6-vLxaAvBzU1gBw@mail.gmail.com>
	<20200207012432.GA23327@agk-dp.fab.redhat.com>
	<20200207014228.GC23327@agk-dp.fab.redhat.com>
In-Reply-To: <20200207014228.GC23327@agk-dp.fab.redhat.com>
From: John Dorminy <jdorminy@redhat.com>
Date: Thu, 6 Feb 2020 22:19:01 -0500
Message-ID: <CAMeeMh_m2EZsN_W0EzwNz7HsLs75QwTDEVY6UT+4HQkqEX8n8Q@mail.gmail.com>
To: John Dorminy <jdorminy@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	Alasdair G Kergon <agk@redhat.com>,
	device-mapper development <dm-devel@redhat.com>
X-MC-Unique: eU-it6cPNDOuIvh3J0qBaw-1
X-MC-Unique: WefgzcZYOXe1K1tOD2Wg5w-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0173JHUm018251
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] dm: expose dm_copy_name_and_uuid()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I agree that adding uuid to all messages would be gross bloat, and a
bad idea to apply everywhere.

I didn't actually realize that devices could be renamed with dmsetup.
Thanks for pointing that out...

On Thu, Feb 6, 2020 at 8:42 PM Alasdair G Kergon <agk@redhat.com> wrote:
>
> On Fri, Feb 07, 2020 at 01:24:33AM +0000, Alasdair G Kergon wrote:
> > In other words, NEVER report name/uuid without ALSO still reporting
> > dm_device_name alongside it.
>
> The reason we only log dm_device_name() is because it is the minimum
> necessary to uniquely identify the device and tie together all
> the messages relating to it.
>
> Adding name/uuid to every message would make log messages unduly long.
> We could offer an in-kernel option to log all setting and changing
> of device names and uuids in the dm core, though I might argue that that
> would just be covering up inadaquate logging in the userspace tools
> making the changes.
>
> Storage-logger offers a compromise that records it all from the
> generated uevents.
>
> Alasdair
>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

