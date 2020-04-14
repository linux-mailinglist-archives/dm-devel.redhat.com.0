Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 21FA61A7860
	for <lists+dm-devel@lfdr.de>; Tue, 14 Apr 2020 12:28:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586860082;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1lmev32rEHfBcTp2TMt7QwiMgHqE7TgQuZ9f2x+P/GA=;
	b=P5RC+Uk6wzLQna66S8PydDRgVXWsS6XT+RWtOmt34RP/9LmrVOr35mkz6ZL9YaCCZDidRG
	S+KL0fGghXY54wdSPa7eJHnxuQEBW5FhIPNQMX6+M0RJbNUCMoHeJ6efXHGiKRb5u/qzDR
	VCVOYafX5syC6GfOXrHtWiYcGtQa288=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-Er9qzcs0OM6WfOVPUgm7JA-1; Tue, 14 Apr 2020 06:28:00 -0400
X-MC-Unique: Er9qzcs0OM6WfOVPUgm7JA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2917DB20;
	Tue, 14 Apr 2020 10:27:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0EC6126510;
	Tue, 14 Apr 2020 10:27:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 13712180880B;
	Tue, 14 Apr 2020 10:27:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03EA6ps0021593 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 06:06:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0F85B2166B2B; Tue, 14 Apr 2020 10:06:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B5B82166B2A
	for <dm-devel@redhat.com>; Tue, 14 Apr 2020 10:06:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9208868C97
	for <dm-devel@redhat.com>; Tue, 14 Apr 2020 10:06:48 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-11-tmUptehiMP2hZvETVwd3yA-1; Tue, 14 Apr 2020 06:06:46 -0400
X-MC-Unique: tmUptehiMP2hZvETVwd3yA-1
Received: by mail-il1-f195.google.com with SMTP id i75so11387949ild.13
	for <dm-devel@redhat.com>; Tue, 14 Apr 2020 03:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GbydlPiIItolcocBG5rOceoTVirC9APRMvqPzphfqlo=;
	b=D+WK0oeYxVkdwhETZs6tt27/puhnOAuZkSzowdSKhixhH92cKDPmvKhfmCrSpVCbSK
	QqtxBVKefWS/WP0q9+WFL9ntiypRHDPRKX8o8aUuIk0H/NQlem6tODFxNbewiFHE43Xs
	Cu/z/LizB9t8r11l/0EsRdJN1lyjxVY/jgFam31R2pX/jzxidXj8C5DtO9+6+Pw3hV7Y
	Lb/Aj+gakt6molT1ynOT8LpuxjGiF96TxaOA8MiA0i7SKdfh6TnIWgAMHXLJMadfui4x
	6IdDXGcRKSC9OM+V9ve9uimCFr3qtl/rrYB7+Z0u+I+eBv+i06rsA7xeRJeSHtZ1U+lw
	8LHQ==
X-Gm-Message-State: AGi0PuY1pk8Sd8aUxm0JWJkGdabFbNS5YW23xjk1HVijnMD8zX0Hdz1A
	g2hv11kdNyUGj4fyOpN2wWptU8PCNnRH5hWaMUc=
X-Google-Smtp-Source: APiQypJWmkXUW3rbwvOceWTXYIJLKf5bRmo5eOdXLdcYV9U6pi2N3q72+/Kb7qs0WTkPgXcT8JiiHYk0rvvg2vdbkT0=
X-Received: by 2002:a92:8f49:: with SMTP id j70mr21022494ild.117.1586858805678;
	Tue, 14 Apr 2020 03:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <f92bef0f-eb40-0e07-540c-321134e4b070@linux.microsoft.com>
	<CAB9W1A1=JyOV3-+6jn3xX-M+GKWBB2cCNh-VWB_kzf+YiR_d2Q@mail.gmail.com>
	<CAP22eLGJbSvUU=W0Jp=gvOFv-nxLC8YTnta3OU2PKbh746MCkQ@mail.gmail.com>
	<1586826679.7311.174.camel@linux.ibm.com>
In-Reply-To: <1586826679.7311.174.camel@linux.ibm.com>
From: "Lev R. Oshvang ." <levonshe@gmail.com>
Date: Tue, 14 Apr 2020 13:06:34 +0300
Message-ID: <CAP22eLGBxy7_Q8dMoJTjBsrhveqhfh7nibzBCqrtWKhXzY74fQ@mail.gmail.com>
To: Mimi Zohar <zohar@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03EA6ps0021593
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 14 Apr 2020 06:27:28 -0400
Cc: sashal@kernel.org, Stephen Smalley <stephen.smalley@gmail.com>,
	nramas@linux.microsoft.com, SELinux <selinux@vger.kernel.org>,
	dm-devel@redhat.com, James Morris <jmorris@namei.org>,
	chpebeni@linux.microsoft.com,
	LSM List <linux-security-module@vger.kernel.org>, suredd@microsoft.com,
	Tushar Sugandhi <tusharsu@linux.microsoft.com>,
	linux-integrity@vger.kernel.org, balajib@microsoft.com
Subject: Re: [dm-devel] [RFC] IMA: New IMA measurements for dm-crypt and
	selinux
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 14, 2020 at 4:11 AM Mimi Zohar <zohar@linux.ibm.com> wrote:
>
> On Sun, 2020-04-12 at 11:15 +0300, Lev R. Oshvang . wrote:
> > On Sat, Apr 11, 2020 at 10:07 PM Stephen Smalley
> > It sees to me that  LKRG (kernel run time guard)  takes the role of
> > measuring kernel structures.  Perhaps you need to consult with LKRG
> > guys.
>
> There definitely sounds like there is some overlap.  LKRG seems to be
> measuring kernel structures for enforcing local integrity.  In the
> context of IMA, measurements are included in the IMA measurement list
> and used to extend a TPM PCR so that it can be quoted.
>
> A generic method for measuring structures and including them in the
> IMA measurement list sounds interesting.
>
> Mimi
>
I frankly do not understand the threat model.
Secure boot or TPM provides trust in encryption/decryption keys
dm-crypt/dm-verify use.
When dm-verify discovers that the disk image is modified it will just
do not allow the system to work ( mount roots, etc).
So imagine that adversary took control of TPM  and changed the keys
dm-verify work with in order to sign malicious content on disk. In
this case, remote attestation should alert of compromised TPM, no
matter whether dmvery keys or other keys were forged.

SELinux is another story and I think a run-time check of SElinux
structures fits well into LKRG. IMA only provide guarantees that
SELinux (or any other LSM) control files and attributes were intact.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

