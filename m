Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8501329CB
	for <lists+dm-devel@lfdr.de>; Tue,  7 Jan 2020 16:17:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578410234;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LkAgiMqxPR8UNm94bu9mRzh2pXYA2eweQB2aB2VrfTk=;
	b=IdkKu0TLzcE5KZuu2ZkTqI72434aVsYDrPShpb6m5coX5v27a3ilZNxKHZt4OBruPzxBfe
	1tBy3dJvL8Aig4T0R0Ulz7YaDSU90D05IWxH/RjfWl1AHUfFos05qtrIQZgpK/3D38UhdK
	QbmfmcRcSvygAqI2g9V2VyONZRmqMq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93--YaPt5WRMiGcUQyLqIItcg-1; Tue, 07 Jan 2020 10:17:08 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56A6A100550E;
	Tue,  7 Jan 2020 15:16:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 757C55D9CA;
	Tue,  7 Jan 2020 15:16:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D894C18089CD;
	Tue,  7 Jan 2020 15:16:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 007FBbxp002258 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Jan 2020 10:11:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 75A082022EAB; Tue,  7 Jan 2020 15:11:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70A982022EAC
	for <dm-devel@redhat.com>; Tue,  7 Jan 2020 15:11:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 556848023B3
	for <dm-devel@redhat.com>; Tue,  7 Jan 2020 15:11:35 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
	[209.85.222.171]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-81-cn1f0jKfNhSFm1mPUC-r_g-1; Tue, 07 Jan 2020 10:11:31 -0500
Received: by mail-qk1-f171.google.com with SMTP id r14so42887173qke.13;
	Tue, 07 Jan 2020 07:11:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=lCxYrNp1iSB5Cnysh20ucd2TNGMfSgfEwMqDb3tP4xM=;
	b=Ri97Oj8HfKG52cHvZtM9f4t2dm1b4QgVvZhnXJ2oJB4i6k835aAYwW4CAnl3oCi0jH
	gpGS7nHcuoe1ASceCXOzA+eYRQbwNilodIYhimMV0IkqLcwq+8E7NQDPRGgMvTmSGBqh
	OngskS6gAH0lDcBOPtM5CaumULRSvRmRt7UqECYu7eSYNt63oUFZHfzh1D//h+gsUBRY
	6xV9MWDw1lQt8onMpb1Sld590h/RRXLn2fB448QQAYKlUXCzY45VFg+Ir1w+C2BS/Vi7
	vaUS2R1clmSbmCRmMT2ksaC8z/wBXa70s5X5tbES74OeBi0SL75XMlvokotK+R3xhDAY
	kNvw==
X-Gm-Message-State: APjAAAUw4C4R5zviieFND04kfPEq/imuJkaAkDVoyQV+xxZyxaIkTv79
	WNxGnAapT+ojgkrtOQKuM6w=
X-Google-Smtp-Source: APXvYqwmxv2AvxL14+3a/xEdClLoyTtWjrwKXdDJPxEICDumOidi19k8RkeGyjKEg3pQHHT2CgB65g==
X-Received: by 2002:a05:620a:48e:: with SMTP id
	14mr86933676qkr.292.1578409891001; 
	Tue, 07 Jan 2020 07:11:31 -0800 (PST)
Received: from localhost (nat-pool-bos-t.redhat.com. [66.187.233.206])
	by smtp.gmail.com with ESMTPSA id
	r205sm22566674qke.34.2020.01.07.07.11.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 07 Jan 2020 07:11:30 -0800 (PST)
From: Mike Snitzer <snitzer@gmail.com>
X-Google-Original-From: Mike Snitzer <ebiggers@kernel.org>
Date: Tue, 7 Jan 2020 10:11:29 -0500
To: =?utf-8?B?eGlhbnJvbmcuemhvdSjlkajlhYjojaMp?= <xianrong.zhou@transsion.com>
Message-ID: <20200107151129.GA34853@lobo>
References: <6b185db43b044bd9ae96036825dee631@transsion.com>
MIME-Version: 1.0
In-Reply-To: <6b185db43b044bd9ae96036825dee631@transsion.com>
X-MC-Unique: cn1f0jKfNhSFm1mPUC-r_g-1
X-MC-Unique: -YaPt5WRMiGcUQyLqIItcg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 007FBbxp002258
X-loop: dm-devel@redhat.com
Cc: Eric Biggers <ebiggers@google.com>, Patrik Torstensson <totte@google.com>,
	=?utf-8?B?eXVhbmppb25nLmdhbyjpq5jmuIrngq8p?= <yuanjiong.gao@transsion.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	=?utf-8?B?cnV4aWFuLmZlbmco5Yav5YSS5ai0KQ==?=
	<ruxian.feng@transsion.com>, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] Reply: [PATCH v3] dm verity: don't prefetch hash
 blocks for already-verified data
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Please fix your mail client so that when you reply to a message you
don't start a new thread.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

