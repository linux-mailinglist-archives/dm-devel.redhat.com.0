Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8D824F2B2
	for <lists+dm-devel@lfdr.de>; Mon, 24 Aug 2020 08:47:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-9Ea9zuW1NpCPGt69nOnHPA-1; Mon, 24 Aug 2020 02:47:11 -0400
X-MC-Unique: 9Ea9zuW1NpCPGt69nOnHPA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32037801ADE;
	Mon, 24 Aug 2020 06:47:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A602F6E715;
	Mon, 24 Aug 2020 06:46:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A0D3C181A06B;
	Mon, 24 Aug 2020 06:46:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07O6kVRA022563 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Aug 2020 02:46:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B6566200BCF0; Mon, 24 Aug 2020 06:46:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1E7B2028DCC
	for <dm-devel@redhat.com>; Mon, 24 Aug 2020 06:46:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D006101A540
	for <dm-devel@redhat.com>; Mon, 24 Aug 2020 06:46:29 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-486-RZzf24T-OmaNRm6NOmqqIw-1; Mon, 24 Aug 2020 02:46:27 -0400
X-MC-Unique: RZzf24T-OmaNRm6NOmqqIw-1
Received: by mail-wm1-f66.google.com with SMTP id a65so3604251wme.5
	for <dm-devel@redhat.com>; Sun, 23 Aug 2020 23:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CtuPWO/rJSxXfCdSgZqM2beqqLnMVASdAJkx3TIrUVM=;
	b=hsXIDpkgzhPzFlH9OSMGkV05HA6rArhPxkIZHhERVIHcs3aM5Wniom9mAG7HxPGxF/
	+OshjWpwwkpcLnD1wlU1LJu6LF1otMSyVbk7A2QMwrFnDgUu0bK+BmfwLKhTzYpGwFqS
	TKF8+a1rR4X2Fe9CLD3wlY/7tjifjl2Yc2B2+RsD+UtjtlrmvLo7itfIWK6JEpSDDcSc
	J0/t1RwbCbQjOHmR+Klv+QtLqIz6EkkmopIYFW61QfzldP8m8YZiGtSWYLZrPzuDdMDS
	mJhoxajHRu0gdgV8fGeVdfHC+8+vyOigb2e7V4/DfGvVkHwHqiCx3hGK1OoPA8V48ox5
	olVA==
X-Gm-Message-State: AOAM531LT4NKEAMORpax/0uP+Vh+KuRouaNVW6SUfq9MGsQTLkxQdXw8
	Irz8D44nU20wZFXgAU7IqC6ttaL9Ojo=
X-Google-Smtp-Source: ABdhPJzFfbwKcRagDEKBjE2vSjYUZYD4jOq02mN3hnQm1Pru+exnrMqvcG0yI7cr6lrpUX76Mt+y0Q==
X-Received: by 2002:a7b:c95a:: with SMTP id i26mr4427355wml.106.1598251585630; 
	Sun, 23 Aug 2020 23:46:25 -0700 (PDT)
Received: from [192.168.2.27] (39.35.broadband4.iol.cz. [85.71.35.39])
	by smtp.gmail.com with ESMTPSA id c8sm553435wrm.62.2020.08.23.23.46.24
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 23 Aug 2020 23:46:24 -0700 (PDT)
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
References: <20200820174538.20837-1-gmazyland@gmail.com>
	<CY4PR04MB37518F3475AE21AB020B628DE7560@CY4PR04MB3751.namprd04.prod.outlook.com>
From: Milan Broz <gmazyland@gmail.com>
Message-ID: <5e803f19-241a-d2ff-6cdb-a45846cd06a0@gmail.com>
Date: Mon, 24 Aug 2020 08:46:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CY4PR04MB37518F3475AE21AB020B628DE7560@CY4PR04MB3751.namprd04.prod.outlook.com>
Content-Language: en-US
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
Subject: Re: [dm-devel] [PATCH] dm-crypt: Document new no_workqueue flags.
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 24/08/2020 03:15, Damien Le Moal wrote:
> On 2020/08/21 2:46, Milan Broz wrote:
>> Patch 39d42fa96ba1b7d2544db3f8ed5da8fb0d5cb877 introduced new
>> dm-crypt no_read_workqueue and no_write_workqueue flags.
>>
>> This patch adds documentation to admin guide for them.
>>
>> Signed-off-by: Milan Broz <gmazyland@gmail.com>
>> ---
>>  Documentation/admin-guide/device-mapper/dm-crypt.rst | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/admin-guide/device-mapper/dm-crypt.rst b/Documentation/admin-guide/device-mapper/dm-crypt.rst
>> index 8f4a3f889d43..94466921415d 100644
>> --- a/Documentation/admin-guide/device-mapper/dm-crypt.rst
>> +++ b/Documentation/admin-guide/device-mapper/dm-crypt.rst
>> @@ -121,6 +121,12 @@ submit_from_crypt_cpus
>>      thread because it benefits CFQ to have writes submitted using the
>>      same context.
>>  
>> +no_read_workqueue
>> +    Bypass dm-crypt internal workqueue and process read requests synchronously.
>> +
>> +no_write_workqueue
>> +    Bypass dm-crypt internal workqueue and process write requests synchronously.
> 
> Could you add one more line here saying something like:
> 
> This option is automatically enabled for host-managed zoned block devices (e.g.
> host-managed SMR hard-disks).

Yes, Mike can squeeze it there (Mike, if you prefer, I can resend the patch with the note above).

I just see one problem here - when we activate device without these flags,
then dm-crypt decides to set the feature bits because of zone device.

So you activate device with some feature set but table will show something different.
It is not a technical problem, but I think DM table was not expected to behave this way.

It is probably not the first change (I think some flags are activated in dm-integrity
according to on-disk superblock state only).

Milan

p.s. Both noqueue flags are now supported in cryptsetup master, for LUKS2 we can store them persistently
(IOW to be used in all later LUKS2 activations if kernel supports it).
It should appear in next stable cryptsetup release.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

