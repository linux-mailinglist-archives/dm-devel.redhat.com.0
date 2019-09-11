Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BBAAFEFC
	for <lists+dm-devel@lfdr.de>; Wed, 11 Sep 2019 16:41:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D35830B259D;
	Wed, 11 Sep 2019 14:41:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD87460C05;
	Wed, 11 Sep 2019 14:41:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DD78E180BA96;
	Wed, 11 Sep 2019 14:41:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8BEfXtl006741 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 11 Sep 2019 10:41:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 151F31001B0B; Wed, 11 Sep 2019 14:41:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx30.extmail.prod.ext.phx2.redhat.com
	[10.5.110.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EBC21001B09
	for <dm-devel@redhat.com>; Wed, 11 Sep 2019 14:41:30 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E9E31DA2
	for <dm-devel@redhat.com>; Wed, 11 Sep 2019 14:41:29 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id g207so3798382wmg.5
	for <dm-devel@redhat.com>; Wed, 11 Sep 2019 07:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=fb5aIf/96MsTRtAYvmbHD6q6dvgU2yAa0B5xxRymi9I=;
	b=LHSXkOG9kOX8JPLjr/yyM9XKOIovO3QL/6ItSkoTV/1/7/Tp/4it7Bd/zOFpXPVtdg
	QVSS0fYEwq9X7iTidIjke7LLFgt4CMgwDxLBOgcsy9dSN3ntQRKsXHkMzQ8tUqAw6wxV
	ZZELZjHyBZ48iqIf7HlBfbfRXtDzlTBamK+GkYYo9pplEmBJMYm58f3Z9vHSfTVzOFdR
	OZqlJ4w+OMmqSBkXXtV2caaPV6a1LofBOLTEOCFenUtrdE3zetxgBoxxRwLzIHf845LH
	hRrdE0i8h76p1NopM5pRK3ljA9HQdWObBdx3otCTcy4AqFSjOuSYJ9zo/q5RU5kfG3vB
	qBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=fb5aIf/96MsTRtAYvmbHD6q6dvgU2yAa0B5xxRymi9I=;
	b=A1e6QKC1IeOJyzvlsPfjrylDhAj5sIdU4/954zQGcj5DZRt0RlAtKYQEODlF/RaVqI
	G2Xn22QFD27Ygdi0cVx2DgXQhnX0h1NcsaEFcSX7sEail+eiyuuhYKLvhEts0n4mVEx5
	+dtotSRR87aVWDLq0k+GVmSU0S8X+x7qOp6fntRZNNYOV0DhWBFCLnVPm98ktfZ3GlMV
	dO41oWDARJ2FRNmxP4SpoX/Ob21GkxbitVnIMy+ZHlLBWmdsBwZCvZREIVlW0hyFtVci
	poBZQ8VJpf8SinyVUNdmrRDVqFHmnoqmjaQ0r1VKfjxPCPeM2/CV2B1qjd4NRmXT/CI0
	sGyA==
X-Gm-Message-State: APjAAAVlQPxGmPQzDHFEteRJVcxsyzSCZjkm3jSlc3CCKMe5rRQzoG1F
	8ijL87zPw+8RYVcMi0r29DVDDA==
X-Google-Smtp-Source: APXvYqxtQuXBE13ofV0aYOgDVG+L1AnIVwSCnRxZKejM9uZMped7BUHB+5BIrMdM8i+zeRPRf8o/ew==
X-Received: by 2002:a05:600c:218c:: with SMTP id
	e12mr4453001wme.40.1568212888180; 
	Wed, 11 Sep 2019 07:41:28 -0700 (PDT)
Received: from [10.94.250.118] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	f197sm3221332wme.22.2019.09.11.07.41.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Sep 2019 07:41:27 -0700 (PDT)
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
References: <20190906142656.5338-1-ntsironis@arrikto.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <e9c47ee3-efc8-e492-9a3d-9c4419601168@arrikto.com>
Date: Wed, 11 Sep 2019 17:41:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906142656.5338-1-ntsironis@arrikto.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.71]);
	Wed, 11 Sep 2019 14:41:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Wed, 11 Sep 2019 14:41:29 +0000 (UTC) for IP:'209.85.128.68'
	DOMAIN:'mail-wm1-f68.google.com' HELO:'mail-wm1-f68.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: -0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.68 mail-wm1-f68.google.com 209.85.128.68
	mail-wm1-f68.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.71
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: vkoukis@arrikto.com, iliastsi@arrikto.com
Subject: Re: [dm-devel] [RFC PATCH v2 0/1] dm: add clone target
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Wed, 11 Sep 2019 14:41:56 +0000 (UTC)

Hi Mike,

I just noticed commit 6cf2a73cb2bc42 ("docs: device-mapper: move it to
the admin-guide"), which moves Documentation/device-mapper/ to
Documentation/admin-guide/device-mapper/.

I sent a v3 which moves dm-clone.rst under
Documentation/admin-guide/device-mapper/.

Sorry for that,
Nikos.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
