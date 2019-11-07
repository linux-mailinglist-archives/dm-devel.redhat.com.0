Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E4C28F38F0
	for <lists+dm-devel@lfdr.de>; Thu,  7 Nov 2019 20:50:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573156202;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UD2pvVn1Y9dtBZ+JL3H7Fewuwa0WAnS5oXqYaghvfCc=;
	b=Ya45UDSFxSSTBxQBMAse7Sbv862v/bsrMr/epoVcKDpYtkthcMqsWt/eEw/vPC5efFXE3S
	0YTHvohk7ZAJ5391CkyGE+jahZDnsoEl3m8X3Rn8Sbn+0VKKa0fADUogv3yyoaQly87LDU
	T9XTc4ASGteedW0JPaZB3iRY2O4RpHg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-goh9hZPpOSKJhH87FuWWuw-1; Thu, 07 Nov 2019 14:50:00 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6016C477;
	Thu,  7 Nov 2019 19:49:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC35A5DA76;
	Thu,  7 Nov 2019 19:49:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65B114BB65;
	Thu,  7 Nov 2019 19:49:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA7JnY0R015143 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 Nov 2019 14:49:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AF036608B8; Thu,  7 Nov 2019 19:49:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E836E608B3;
	Thu,  7 Nov 2019 19:49:31 +0000 (UTC)
Date: Thu, 7 Nov 2019 14:49:31 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Maged Mokhtar <mmokhtar@petasan.org>
Message-ID: <20191107194930.GA2986@redhat.com>
References: <fa95f1f0-67d6-d02e-6999-ba1f90d70fe2@petasan.org>
	<8388b99a-a531-981e-9e36-8aeb3dffd18e@petasan.org>
	<20191106150831.GA27888@redhat.com>
	<5370f009-c324-1530-4400-adf1b59f0bbd@petasan.org>
	<20191107190958.GA2821@redhat.com>
	<cba8f93a-3477-9c87-0bff-fe7e6962d606@petasan.org>
MIME-Version: 1.0
In-Reply-To: <cba8f93a-3477-9c87-0bff-fe7e6962d606@petasan.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, mpatocka@redhat.com
Subject: Re: [dm-devel] dm-writecache: change config parameters using
	messages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: goh9hZPpOSKJhH87FuWWuw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Nov 07 2019 at  2:29pm -0500,
Maged Mokhtar <mmokhtar@petasan.org> wrote:

>=20
>=20
> On 07/11/2019 21:09, Mike Snitzer wrote:
> >On Thu, Nov 07 2019 at  1:55pm -0500,
> >Maged Mokhtar <mmokhtar@petasan.org> wrote:
> >
> >>
> >>
> >>On 06/11/2019 17:08, Mike Snitzer wrote:
> >>>On Tue, Nov 05 2019 at  4:19pm -0500,
> >>>Maged Mokhtar <mmokhtar@petasan.org> wrote:
> >>>
> >>>>Gentle ping please.
> >>>>
> >>>>It could add flexibility in changing cache parameters after device cr=
eation.
> >>>
> >>>I'm inclined to _not_ take this type of change.
> >>>
> >>>Why isn't changing the config parameters via table reload viable for
> >>>you?
> >>>
> >>
> >>
> >>Hi Mike,
> >>
> >>Thank you for your response. The main issue is to enable setting
> >>some config parameters while the device is mounted and running and
> >>avoid calling target ctr() by sending parameter changes via
> >>messages. A similar setup was used in dm-cache.
> >>
> >>The reason is that tuning the write cache may require run time
> >>changes. If un-tuned we can observes periods of spikes and/or step
> >>like disk utilization on the slow device during writeback using
> >>iostat, and these spikes correspond to periods of increased client
> >>io latency. Utilization can be tuned by varying the number of active
> >>writeback jobs + the gap between high and low marks to achieve a
> >>smooth high utilization.  Such tuning is difficult to do when
> >>creating the cache device as it depends on the hardware and io
> >>workload. We are hoping to use some userspace monitoring and tuning
> >>tool to periodically adjust these values while the device is
> >>running.
> >
> >I think you're missing that any actively used DM device can be
> >suspended, table reloaded, resumed.  So the tuning at runtime is still
> >possible, it just requires more steps.
> >
> >And I'm saying that unless/until there is a better reason other than
> >"dm-cache allowed tuning via messages" I'm not interested in having
> >multiple methods for tuning dm-writecache.
> >
> >Mike
> >
> just for my understanding, does not table reload call _ctr() and
> re-initializes things like threads/read metadada ..?

It does, so if you can demonstrate that using suspend/reload/resume vs
your messages is cause for reduced overall performance that would help
justify your patch.

But if you're having to tune so actively that it matters I'd argue the
tuning is a workaround for a more systemic issue in the dm-writecaache
code.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

