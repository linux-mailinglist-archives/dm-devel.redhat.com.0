Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 51A88109D6A
	for <lists+dm-devel@lfdr.de>; Tue, 26 Nov 2019 13:01:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574769685;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Hp4+QklRuc4BoiJEappLA0Xn7iKdNMTyg5vePT9vaR4=;
	b=IOwAMEC9dRENmnp0uZ0YOuANL9QmQJp+8bPouXJtLlbMZBUjPfLFYDXROaL8qR1Gq+/DnU
	A6e8qJ7JeQ2FdN9ytrMRhK6WITxTAh61f862uSMTozDs/Sl3p2Ll3W22+cO5QpevbHltyS
	JQ3TLkZCx2KkWXyWNAIP7HsTzBSUch4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-TLEw6BgAMi65RN2_k4XRYg-1; Tue, 26 Nov 2019 07:01:23 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6272FA40B38;
	Tue, 26 Nov 2019 12:01:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6EE510021B3;
	Tue, 26 Nov 2019 12:01:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CCB5E4BB65;
	Tue, 26 Nov 2019 12:00:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAQC0fLH031268 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 26 Nov 2019 07:00:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0D1E720316DF; Tue, 26 Nov 2019 12:00:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08CD62026D68
	for <dm-devel@redhat.com>; Tue, 26 Nov 2019 12:00:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A49578F2510
	for <dm-devel@redhat.com>; Tue, 26 Nov 2019 12:00:38 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-162-3Fru6ctTMPqGRZhpNd-iSA-1; Tue, 26 Nov 2019 07:00:36 -0500
Received: by mail-lj1-f195.google.com with SMTP id m6so12515781ljc.1
	for <dm-devel@redhat.com>; Tue, 26 Nov 2019 04:00:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:references:to:from:cc:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=IFNI4PdEB+eajSidtmcxTMBHQ3nc9k/nAfekVfeQcmw=;
	b=FKvS7fLhiO6MR5rMv7C2afg2rrPJpJP+JqvDZpDuIJOYl4mPOLEq7DG0dBw05amzXB
	Cy2epBQn+cp6rPuQMBA/dvyPCP1VAL0VMPxx+Y9BcYUn5suS3IYG5BK+6D8jEFeHXGAg
	iFmsaaIdkhn0tXOjtFcYGqdrpMHoxiWEQoMe07JCEr8ER4jFeV/Bz2IXViiGPi+adZgI
	N00w95/oJ8EFQ8O33OrgGLZSFO3jh5w3QWQ4LOldUX15607mBrfSKiOwgzZUAK6Oe+WH
	NztmQLcateBvVlwcgX7r1q8ZJrUr28L8d+Zs+NnxvxavjE+m5e+Xr+gBSmYlux9gWm6j
	AZbg==
X-Gm-Message-State: APjAAAUafsVVGyCN8KcMMxlxnZkxHU6JPLnrYNfoZKeeAJvKnYqec9bo
	+ZB1x21UDlfB2QEpjgyaS1ydYA==
X-Google-Smtp-Source: APXvYqxGmO1ck6iNCQXlf+AhgaRT/ZGpPHopc1jv2HL5OBikuwci2tYP4UnDOBzqdnvQdvu9sVEeeQ==
X-Received: by 2002:a2e:9842:: with SMTP id e2mr26269542ljj.93.1574769635010; 
	Tue, 26 Nov 2019 04:00:35 -0800 (PST)
Received: from [10.94.250.133] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	a11sm5393684ljm.60.2019.11.26.04.00.33
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 26 Nov 2019 04:00:33 -0800 (PST)
References: <2044145.ITN4Tc4rAJ@archlinux>
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
From: Nikos Tsironis <ntsironis@arrikto.com>
X-Forwarded-Message-Id: <2044145.ITN4Tc4rAJ@archlinux>
Message-ID: <6635828b-2ca6-c4d4-fc70-46e9a0bd2ed5@arrikto.com>
Date: Tue, 26 Nov 2019 14:00:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <2044145.ITN4Tc4rAJ@archlinux>
Content-Language: en-US
X-MC-Unique: 3Fru6ctTMPqGRZhpNd-iSA-1
X-MC-Unique: TLEw6BgAMi65RN2_k4XRYg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: diegocg@gmail.com
Subject: [dm-devel] [PATCH] dm clone: Add to the documentation index
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

From: Diego Calleja <diegocg@gmail.com>

It was missing from the initial commit

Signed-off-by: Diego Calleja <diegocg@gmail.com>

---
  Documentation/admin-guide/device-mapper/index.rst | 1 +
  1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/device-mapper/index.rst b/
Documentation/admin-guide/device-mapper/index.rst
index c77c58b8f67b..d8dec8911eb3 100644
--- a/Documentation/admin-guide/device-mapper/index.rst
+++ b/Documentation/admin-guide/device-mapper/index.rst
@@ -8,6 +8,7 @@ Device Mapper
      cache-policies
      cache
      delay
+    dm-clone
      dm-crypt
      dm-flakey
      dm-init
-- 
2.24.0




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

