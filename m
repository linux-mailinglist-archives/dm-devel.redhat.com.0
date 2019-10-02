Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD11C8914
	for <lists+dm-devel@lfdr.de>; Wed,  2 Oct 2019 14:57:53 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A0D430860DC;
	Wed,  2 Oct 2019 12:57:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E03DF5F7D7;
	Wed,  2 Oct 2019 12:57:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 784C31800B74;
	Wed,  2 Oct 2019 12:57:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x92Cu78I029560 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Oct 2019 08:56:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7EA7A5D9DC; Wed,  2 Oct 2019 12:56:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx21.extmail.prod.ext.phx2.redhat.com
	[10.5.110.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79B695D9D3
	for <dm-devel@redhat.com>; Wed,  2 Oct 2019 12:56:05 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F318F18C4289
	for <dm-devel@redhat.com>; Wed,  2 Oct 2019 12:56:03 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id y21so6906521wmi.0
	for <dm-devel@redhat.com>; Wed, 02 Oct 2019 05:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:mime-version:content-language
	:content-transfer-encoding;
	bh=l2haXA+5nb2+OyQEU+1WnPNtSY6g2sRTyRfmIoB9Dzk=;
	b=lz9awy0QpkonAvH8/4oYWCRO6qqeM2DQHnm+MnUH98CpZjgrdeZwpLO00P2zqab5Sf
	ihwlRl2BMIdjcD2UFutcuZYkjbDvic6C5qZD54Vo6JDOY2sf/flQCSQjxq3vYbqyi65t
	T8aGL5PgQrf61Q9Yl9Ixl4fp5Mrez1MWWnvDj7d91jkjHrRM6hRLyaxd68Bfa5lrYJiN
	MvEWlBKOdLr3DvfMdBwsoolw/TuboFmFlRnj0WbgX3fav8Nq2bzYeTaZWYvgbLYaUEDg
	0n5JnSCRZGCtUr3EDsId3cUgkOaDoCV1NMJRc4itLuV01+/cM2phQtny2xiHUmGm/c5m
	pNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:mime-version
	:content-language:content-transfer-encoding;
	bh=l2haXA+5nb2+OyQEU+1WnPNtSY6g2sRTyRfmIoB9Dzk=;
	b=svmnxvloclJ00z42vHZyyYxyNeJD+CVRnGZN6E7pNbkY/703fwSWPwe3suX3ggZJz5
	+uBJ5iH35VHjgp5rIqooPLJk94GtQvd33Ka3mG1/+L1WhILRaieGQnmI0R69hlK1Tgfz
	8w/pI47PpEfzC5Sz182PqGzhQ0GcNnzzVnRhasOdTKAgi9Lv/jBE5+naYAvgmndimK2d
	9u5ifDwd3qtVuvO4vzul98GmFrZZ5OmnMHGV5TPjQ7VjsTpIU8y4ETIWIXTFjrSpYFSh
	dkiv2UTThFt77RUhhGAh0qBDOy4UCNc+mFtV+Y5wdq3+XkRoDiNyi9cOBCIVxQnTRSuv
	Cz5g==
X-Gm-Message-State: APjAAAVNTBMIn5mRzbzMYLuXfQOn2lmlMU+M7N4NNin0QxbQoqZR5u7B
	2sviZJuGM7NttpPWHRsf9bzOZhQ=
X-Google-Smtp-Source: APXvYqxWPusYpDIfKdKn/HJqS588iZhhccoPXGfTr5vKs31bhivemdBO/rVTGsal1MW6junRPJM6jA==
X-Received: by 2002:a1c:4886:: with SMTP id v128mr2812262wma.176.1570020962309;
	Wed, 02 Oct 2019 05:56:02 -0700 (PDT)
Received: from localhost (118.red-88-12-24.staticip.rima-tde.net.
	[88.12.24.118]) by smtp.gmail.com with ESMTPSA id
	h10sm5170390wrq.95.2019.10.02.05.56.01
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 02 Oct 2019 05:56:02 -0700 (PDT)
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	DM-DEVEL ML <dm-devel@redhat.com>
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
Message-ID: <d9c6c092-2ba8-8fb5-7b66-8b151cae51a4@gmail.com>
Date: Wed, 2 Oct 2019 14:56:00 +0200
MIME-Version: 1.0
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.62]);
	Wed, 02 Oct 2019 12:56:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]);
	Wed, 02 Oct 2019 12:56:04 +0000 (UTC) for IP:'209.85.128.52'
	DOMAIN:'mail-wm1-f52.google.com' HELO:'mail-wm1-f52.google.com'
	FROM:'xose.vazquez@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.128.52 mail-wm1-f52.google.com 209.85.128.52
	mail-wm1-f52.google.com <xose.vazquez@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.62
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [multipath-tools] merges
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Wed, 02 Oct 2019 12:57:52 +0000 (UTC)

Hi Christophe,

0.8.3 is not tagged: https://git.opensvc.com/?p=multipath-tools/.git;a=tags


Thanks.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
