Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 324AD257DD
	for <lists+dm-devel@lfdr.de>; Tue, 21 May 2019 20:57:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EBC1A3082E58;
	Tue, 21 May 2019 18:57:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F2575E7D9;
	Tue, 21 May 2019 18:56:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F0CF5ED61;
	Tue, 21 May 2019 18:56:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4LItTKV030674 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 May 2019 14:55:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3187418C41; Tue, 21 May 2019 18:55:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CCF518786
	for <dm-devel@redhat.com>; Tue, 21 May 2019 18:55:27 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
	[209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 22E94308FC5F
	for <dm-devel@redhat.com>; Tue, 21 May 2019 18:55:09 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id f126so146487qkc.9
	for <dm-devel@redhat.com>; Tue, 21 May 2019 11:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=k5xaw96/dfaoDX1daZgouVzHGykgESQleSuEqXdRJoM=;
	b=EdmSsxVHG6+2oWISv3KySKH7QZS5z6lwEOhAE6NpCTODLE9uTVonuixMpyPQ8kJ8GR
	tQDdQUJgqlhrOpX/2IpLQhJh5DMwI3vs71DX9WLgPOWawuLPfKbmeVsp6fYCwtx+EycE
	DOzJK1gIZkx/Oxpzm/TqIAdLXO7oZFZ1F/ZYyWmzCFVens6T2egLIjDsaVSrIWaUS2om
	8epZriarVzIKYQZgxRCrr2MWfFmxIr6C7BNAxFJKQ/QmKvCdIqcU0ZldaVlEL3OvoAfR
	8ontV2P6qt43f5ppQGBA9aaS6sSfQDGjKCGEthZsQGglq/Xt2Ix9bHWg9Ppz6RqDrzQu
	m6Lw==
X-Gm-Message-State: APjAAAUWw4qAoAIukLqN4zUK5vpKVAgSeVw+vJJviGsFXIeWKFPJXeLB
	Qcs6e6iBVfzr+aMlTebHxu1VHWDl7jjd0qHbrVQ=
X-Google-Smtp-Source: APXvYqwFYb7MTqr7itDgsrm+BZMTT1UgiFT6j1UXP8KS/aowOxOSd103xJhIwM9rROS8dGrWSX9YxZsUevJ5ATTuce8=
X-Received: by 2002:a05:620a:12da:: with SMTP id
	e26mr22850981qkl.132.1558464908183; 
	Tue, 21 May 2019 11:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <297da4cbe20235080205719805b08810@bi-co.net>
	<CAJCQCtR-uo9fgs66pBMEoYX_xAye=O-L8kiMwyAdFjPS5T4+CA@mail.gmail.com>
	<8C31D41C-9608-4A65-B543-8ABCC0B907A0@bi-co.net>
	<CAJCQCtTZWXUgUDh8vn0BFeEbAdKToDSVYYw4Q0bt0rECQr9nxQ@mail.gmail.com>
	<AD966642-1043-468D-BABF-8FC9AF514D36@bi-co.net>
	<158a3491-e4d2-d905-7f58-11a15bddcd70@gmx.com>
	<C1CD4646-E75D-4AAF-9CD6-B3AC32495FD3@bi-co.net>
	<CAK-xaQYPs62v971zm1McXw_FGzDmh_vpz3KLEbxzkmrsSgTfXw@mail.gmail.com>
	<9D4ECE0B-C9DD-4BAD-A764-9DE2FF2A10C7@bi-co.net>
	<CAK-xaQYakXcAbhfiH_VbqWkh+HBJD5N69ktnnA7OnWdhL6fDLA@mail.gmail.com>
	<ea5552b8-7b6a-2516-d968-c3f3c731e159@gmail.com>
In-Reply-To: <ea5552b8-7b6a-2516-d968-c3f3c731e159@gmail.com>
From: Andrea Gelmini <andrea.gelmini@gelma.net>
Date: Tue, 21 May 2019 20:54:56 +0200
Message-ID: <CAK-xaQYT_m2UV0w_MLbpGAb-ckyVc1YLnGdpX42eQRj1JZf4WA@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 21 May 2019 18:55:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Tue, 21 May 2019 18:55:09 +0000 (UTC) for IP:'209.85.222.182'
	DOMAIN:'mail-qk1-f182.google.com'
	HELO:'mail-qk1-f182.google.com' FROM:'andrea.gelmini@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.005  (FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
	SPF_NONE) 209.85.222.182 mail-qk1-f182.google.com 209.85.222.182
	mail-qk1-f182.google.com <andrea.gelmini@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Chris Murphy <lists@colorremedies.com>, dm-devel@redhat.com,
	=?UTF-8?B?TWljaGFlbCBMYcOf?= <bevan@bi-co.net>,
	Btrfs BTRFS <linux-btrfs@vger.kernel.org>,
	Qu Wenruo <quwenruo.btrfs@gmx.com>
Subject: Re: [dm-devel] fstrim discarding too many or wrong blocks on Linux
 5.1, leading to data loss
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 21 May 2019 18:57:02 +0000 (UTC)

Il giorno lun 20 mag 2019 alle ore 18:45 Milan Broz
<gmazyland@gmail.com> ha scritto:
> Note, it is the root filesystem, so you have to regenerate initramfs
> to update crypttab inside it.

Good catch. I didn't re-mkinitramfs.

> Could you paste "dmsetup table" and "lsblk -D" to verify that discard flag
> is not there?
> (I mean dmsetup table with the zeroed key, as a default and safe output.)

This weekend if I have time I'm going to re-test it. It takes a lot to
restore 4TB.

Thanks a lot,
Andrea

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
