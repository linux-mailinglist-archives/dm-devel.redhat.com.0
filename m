Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9D50B2F0D56
	for <lists+dm-devel@lfdr.de>; Mon, 11 Jan 2021 08:44:14 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-uVAboqebN1u-Ak57AxztIA-1; Mon, 11 Jan 2021 02:44:11 -0500
X-MC-Unique: uVAboqebN1u-Ak57AxztIA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED6E8801AC0;
	Mon, 11 Jan 2021 07:44:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1D3519744;
	Mon, 11 Jan 2021 07:44:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 817D04BB7B;
	Mon, 11 Jan 2021 07:43:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10B7haVO001363 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 Jan 2021 02:43:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 21CC7111285E; Mon, 11 Jan 2021 07:43:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DCA0111285C
	for <dm-devel@redhat.com>; Mon, 11 Jan 2021 07:43:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AB4180391A
	for <dm-devel@redhat.com>; Mon, 11 Jan 2021 07:43:32 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-124-8X7v2K9qOHOr-fTmepERnQ-1;
	Mon, 11 Jan 2021 02:43:28 -0500
X-MC-Unique: 8X7v2K9qOHOr-fTmepERnQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9D16CAD18;
	Mon, 11 Jan 2021 07:43:26 +0000 (UTC)
To: Martin Wilck <mwilck@suse.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
References: <3baec678cfdc3c8ed2024b2df2f316d1694fe699.camel@suse.com>
	<CABr-Gnd1TJhd7QSge+vAwrJZSHuUjW7hbKd-sFwx=zdNotv_Eg@mail.gmail.com>
	<85d7c08115fd50c413ddcd957f22f40db2215f19.camel@suse.com>
	<f74cbc725ec8cb75016e8061c46eeb628d30bb25.camel@suse.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <eabe0f24-b32f-ff5f-b808-b2c501263d8f@suse.de>
Date: Mon, 11 Jan 2021 08:43:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <f74cbc725ec8cb75016e8061c46eeb628d30bb25.camel@suse.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10B7haVO001363
X-loop: dm-devel@redhat.com
Cc: dm-devel mailing list <dm-devel@redhat.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: Re: [dm-devel] New draft openSUSE multipath-tools repo on github
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
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"

On 1/6/21 11:45 PM, Martin Wilck wrote:
> Hi Christophe, Ben, everybody,
>=20
> On Tue, 2021-01-05 at 22:45 +0100, Martin Wilck wrote:
>> Hi Christophe,
>>
>> On Sat, 2020-12-19 at 11:26 +0100, Christophe Varoqui wrote:
>>> Sure, nice work.
>>>
>>> Would you like to create a PR, to merge it upstream ?
>>> So we can test if this process makes sense.
>>
>> Sure, will do.
>>
>> One problem that I currently have is that the openSUSE/multipath-
>> tools
>> repo is a fork of your old repo, and it's impossible to change the
>> upstream repo in github, AFAICS. Therefore I can't create a PR
>> directly
>> from openSUSE/multipath-tools.
>>
>> I guess I'll have to re-build the openSUSE/multipath-tools repo "from
>> scratch" as a fork of your new github repo before we can
>> realistically
>> work with github PRs. That's a bit of work because there are many
>> branches, and it needs to be discussed and coordinated in our
>> organization.
>=20
> I've drafted the new openSUSE multipath-tools github repo now:
>=20
> https://github.com/openSUSE/multipath-tools-1
>=20
> (the repo name will change!)
>=20
> This repo is forked from Christophe's github repo and will thus allow
> creating Pull Requests for Christophe.
>=20
> I have simplified the branch names that matter for upstream development
> wrt the old repo:
>=20
>    upstream-queue -> queue
>    upstream-fixes -> fixes
>    upstream-tip -> tip (this one contains github CI)
>=20
> Besides these, the repo contains some (open)SUSE-specific branches and
> tags, but I've left out a lot of old stuff which will continue to live
> on the old openSUSE repo only.
>=20
> Please have a look. If I get positive feedback, I'll rename the current
> openSUSE multipath-tools repo to "openSUSE/multipath-tools-pre2021" and
> rename this one to "openSUSE/multipath-tools".
>=20
Looks good to me.

Cheers,

Hannes
--=20
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
HRB 36809 (AG N=FCrnberg), Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

