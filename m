Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B8D92324CC7
	for <lists+dm-devel@lfdr.de>; Thu, 25 Feb 2021 10:27:46 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-iPsv85PKMoeX3u5R_92uug-1; Thu, 25 Feb 2021 04:27:43 -0500
X-MC-Unique: iPsv85PKMoeX3u5R_92uug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 881BA193578E;
	Thu, 25 Feb 2021 09:27:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B7AB19D9C;
	Thu, 25 Feb 2021 09:27:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7FCE24EEF6;
	Thu, 25 Feb 2021 09:27:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11O9QBV0015882 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Feb 2021 04:26:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4ECDF2026D3A; Wed, 24 Feb 2021 09:26:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4796F2026D48
	for <dm-devel@redhat.com>; Wed, 24 Feb 2021 09:26:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5ABC81F45B
	for <dm-devel@redhat.com>; Wed, 24 Feb 2021 09:26:06 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-89--v0KteKzO1-SE-HWbUVAVQ-1; Wed, 24 Feb 2021 04:26:04 -0500
X-MC-Unique: -v0KteKzO1-SE-HWbUVAVQ-1
Received: by mail-pf1-f172.google.com with SMTP id 201so957518pfw.5
	for <dm-devel@redhat.com>; Wed, 24 Feb 2021 01:26:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=skeImN742nfG4E0VR51CuEJEgnI11NI7CM+fbkLvJHE=;
	b=Rk+FEaaEYuNAw/qkJcOcqNR836tegCa7gn3xHh3aJSBp4d/AJY+fmnvJBWKiZml1U0
	vOnhh+daSrRPpUIp9RX2xalxv/S9oRI5HgxuXpL3TNKTSEQONXXut9Wbp2ogZ7UUdIzm
	xAEpaxM0Z3TripgZJqpd5IW8PBMyXhVq4MdTseeDW+WpfDL/VBzutSN96En/hKpudwqU
	83+J1aJbDWvkOLDISySzyg2El/Q7fC4rlBFkwe2Vp6+DPHbaclVNy4ng1dvVPLzaw6Gn
	2A7MsTMrL2YpYjFcPadJTykFHeQG1lCXMFrjkP463IDOSOAVCDaRMuc8CMUJMltiq2bC
	YF2w==
X-Gm-Message-State: AOAM531rYfM6U9H2EhiSgMREsvFLhIyhyQvjgqLl5fpZ2gJFwPzCH2J5
	FVUpp1yrAzxpCfaoAOFiA9Tzrg==
X-Google-Smtp-Source: ABdhPJwNecl6jFwBFdxrR9hTadcRdwBZB3K+w0crjykXhBn8Jc1gVvlfJaQSqb4iF2lgIXJ/PgvMjw==
X-Received: by 2002:a65:5ac9:: with SMTP id d9mr27664900pgt.74.1614158761974; 
	Wed, 24 Feb 2021 01:26:01 -0800 (PST)
Received: from [0.0.0.0] ([62.217.45.26]) by smtp.gmail.com with ESMTPSA id
	g9sm1946042pfo.115.2021.02.24.01.25.54
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 24 Feb 2021 01:26:01 -0800 (PST)
To: Song Liu <song@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>
References: <1613177399-22024-1-git-send-email-guoqing.jiang@cloud.ionos.com>
	<36a660ed-b995-839e-ac82-dc4ca25ccb8a@molgen.mpg.de>
	<CAPhsuW5s6fk3kua=9Z9o3VPCcN1wdUqXybXm9cp4arJW5+oBvQ@mail.gmail.com>
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
Message-ID: <9f28f6e2-e46a-bfed-09d8-2fec941ea881@cloud.ionos.com>
Date: Wed, 24 Feb 2021 10:25:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPhsuW5s6fk3kua=9Z9o3VPCcN1wdUqXybXm9cp4arJW5+oBvQ@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 25 Feb 2021 04:27:13 -0500
Cc: Mike Snitzer <snitzer@redhat.com>, linux-raid <linux-raid@vger.kernel.org>,
	dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>,
	Donald Buczek <buczek@molgen.mpg.de>, it+raid@molgen.mpg.de
Subject: Re: [dm-devel] [PATCH V2] md: don't unregister sync_thread with
 reconfig_mutex held
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"



On 2/24/21 10:09, Song Liu wrote:
> On Mon, Feb 15, 2021 at 3:08 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>>
>> [+cc Donald]
>>
>> Am 13.02.21 um 01:49 schrieb Guoqing Jiang:
>>> Unregister sync_thread doesn't need to hold reconfig_mutex since it
>>> doesn't reconfigure array.
>>>
>>> And it could cause deadlock problem for raid5 as follows:
>>>
>>> 1. process A tried to reap sync thread with reconfig_mutex held after echo
>>>      idle to sync_action.
>>> 2. raid5 sync thread was blocked if there were too many active stripes.
>>> 3. SB_CHANGE_PENDING was set (because of write IO comes from upper layer)
>>>      which causes the number of active stripes can't be decreased.
>>> 4. SB_CHANGE_PENDING can't be cleared since md_check_recovery was not able
>>>      to hold reconfig_mutex.
>>>
>>> More details in the link:
>>> https://lore.kernel.org/linux-raid/5ed54ffc-ce82-bf66-4eff-390cb23bc1ac@molgen.mpg.de/T/#t
>>>
>>> And add one parameter to md_reap_sync_thread since it could be called by
>>> dm-raid which doesn't hold reconfig_mutex.
>>>
>>> Reported-and-tested-by: Donald Buczek <buczek@molgen.mpg.de>
>>> Signed-off-by: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
> 
> I don't really like this fix. But I haven't got a better (and not too
> complicated)
> alternative.
> 
>>> ---
>>> V2:
>>> 1. add one parameter to md_reap_sync_thread per Jack's suggestion.
>>>
>>>    drivers/md/dm-raid.c |  2 +-
>>>    drivers/md/md.c      | 14 +++++++++-----
>>>    drivers/md/md.h      |  2 +-
>>>    3 files changed, 11 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
>>> index cab12b2..0c4cbba 100644
>>> --- a/drivers/md/dm-raid.c
>>> +++ b/drivers/md/dm-raid.c
>>> @@ -3668,7 +3668,7 @@ static int raid_message(struct dm_target *ti, unsigned int argc, char **argv,
>>>        if (!strcasecmp(argv[0], "idle") || !strcasecmp(argv[0], "frozen")) {
>>>                if (mddev->sync_thread) {
>>>                        set_bit(MD_RECOVERY_INTR, &mddev->recovery);
>>> -                     md_reap_sync_thread(mddev);
>>> +                     md_reap_sync_thread(mddev, false);
> 
> I think we can add mddev_lock() and mddev_unlock() here and then we don't
> need the extra parameter?
> 

I thought it too, but I would prefer get the input from DM people first.

@ Mike or Alasdair


Thanks,
Guoqing

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

