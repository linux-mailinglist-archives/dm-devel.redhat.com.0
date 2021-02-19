Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6657431F760
	for <lists+dm-devel@lfdr.de>; Fri, 19 Feb 2021 11:38:08 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-4a1wx9y-NvG4x2IPrakRlA-1; Fri, 19 Feb 2021 05:38:04 -0500
X-MC-Unique: 4a1wx9y-NvG4x2IPrakRlA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E81910B9CAE;
	Fri, 19 Feb 2021 10:37:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3E4E10016F8;
	Fri, 19 Feb 2021 10:37:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E500018095CB;
	Fri, 19 Feb 2021 10:37:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11JAZiDA032204 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Feb 2021 05:35:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 50AC8202A45F; Fri, 19 Feb 2021 10:35:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B8072026D46
	for <dm-devel@redhat.com>; Fri, 19 Feb 2021 10:35:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3B04858F0F
	for <dm-devel@redhat.com>; Fri, 19 Feb 2021 10:35:41 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-294-glYkQ8MzOMeevT8gTcXNWA-1;
	Fri, 19 Feb 2021 05:35:37 -0500
X-MC-Unique: glYkQ8MzOMeevT8gTcXNWA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6FF05ACCF;
	Fri, 19 Feb 2021 10:35:36 +0000 (UTC)
Message-ID: <f0a6b5716cfde01b0dc097a61efec6a908d4028e.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: "Hexiaowen (Hex, EulerOS)" <hexiaowen@huawei.com>, lixiaokeng
	<lixiaokeng@huawei.com>, Benjamin Marzinski <bmarzins@redhat.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 19 Feb 2021 11:35:35 +0100
In-Reply-To: <d1359701-6c22-f199-8c36-15ea733f7ccc@huawei.com>
References: <20210128210852.23207-1-mwilck@suse.com>
	<c1dddccecfe0e12a2fe2dca66faad740a30acd53.camel@suse.com>
	<99488b1b-2339-338d-e951-0b8f3e78449b@huawei.com>
	<15415073-3b0b-c5a3-ec1d-ced704a42a86@huawei.com>
	<05408634d2361998782d80b34b7de64d452ba09c.camel@suse.com>
	<6c80ccbe-0c35-aef8-e95b-97acd06a3487@huawei.com>
	<7b2c571eb7ff9d54c51037a4fae87796ead1144e.camel@suse.com>
	<3c8f215a-75d5-0f7b-1008-c8c565bb0cf3@huawei.com>
	<11c072c152937004e5f08ecff8dd9ded7d915af6.camel@suse.com>
	<3e0d931e-d0df-69e3-21f7-456b99e5b6f3@huawei.com>
	<d1359701-6c22-f199-8c36-15ea733f7ccc@huawei.com>
User-Agent: Evolution 3.38.2
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] multipathd: avoid crash in uevent_cleanup()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2021-02-10 at 10:29 +0800, Hexiaowen (Hex, EulerOS) wrote:
> 
> We use the release version openEuler 20.03 LTS and the systemd
> version 243.
> 
> During RPMbuild, add -fexceptions globally to CFLAGS.

I have seen that OpenEuler does this for systemd (but not for
multipath).

>From the understanding I've gathered so far, enabling -fexceptions in
libsystemd is at least part of the problem. As OpenEuler is maintained
by Huawei - why are you doing this? I've talked with our toolchain
maintainers, and they clearly did not recommend doing it for C
programs.

Regards,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

