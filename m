Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D4EA4152
	for <lists+dm-devel@lfdr.de>; Sat, 31 Aug 2019 02:30:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 96B8483BD2;
	Sat, 31 Aug 2019 00:30:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0851608A5;
	Sat, 31 Aug 2019 00:30:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F26551802218;
	Sat, 31 Aug 2019 00:29:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7V0RvmZ009227 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 30 Aug 2019 20:27:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8A70C60BF7; Sat, 31 Aug 2019 00:27:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx25.extmail.prod.ext.phx2.redhat.com
	[10.5.110.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84E0560BEC
	for <dm-devel@redhat.com>; Sat, 31 Aug 2019 00:27:55 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
	[209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9FEBF10F23F7
	for <dm-devel@redhat.com>; Sat, 31 Aug 2019 00:27:53 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id y21so3088315ybi.11
	for <dm-devel@redhat.com>; Fri, 30 Aug 2019 17:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=/6sj/1KFErkTLfZwBj9nEUaXoIe1A0ss/20eaHdy3Vk=;
	b=lz2Qez8aHpQpigEAMDsVbRsbLgEzMAwuL8UdlT8V47MmynY2kkf9I/A6jWLqZpSWHZ
	JPKXg0dkK+xE/vnMhUQtop6qZdxlZjZwST430RAnuqK1T+s6ZKDzSRKXjNUuz0NYQr65
	dUJGC3kI4PBa8GrG7hKp6wvNvQCtLRpToJlt+tGRt3IdC1OrYj6TjF30Y40ls4//xKof
	7hlMKT1KkPurJveVeLGXTGghjIjR/ULmiEHaWm2yXIkAsLE+ICYXodZeXEfFn+IUKlub
	72B2derafFLGM8JoJz2YUi8n7R2orqg1Ln/in1ve5LXAIERFCYXEW5araBOzr0TRzx5V
	7B8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=/6sj/1KFErkTLfZwBj9nEUaXoIe1A0ss/20eaHdy3Vk=;
	b=ZWsJgShbVfdlGzP6d41dMgblsO5pOWdAnqm3Pgi1oxcZBlCRwJjuyVFmoNw5X1YzQ0
	heSdXiJ+05cBKVFlfqPd+IZV6llxQTPpMSFUV8LXlBqqXD7IEzS4KLnlE6utxJwqd7Vt
	CvRtfgVoXlcVgDlR+wa16qPGdJ9O2iEMfKETuPvlsoL4r9t6tivnRXI63S33ojGGN7Ad
	CFvSPGfNaxHPxN6xZDInQEkZKeps5UYsG73351OIVhs+rcvUPJpdsDvfqqqLjlbeaKjL
	bEKXC+KrUR8e5U4V6GI0QNqGjaq4t58QQIxdlfsHEN27KtZMJtO+LUr5xSHYoQF5Gac5
	j6iQ==
X-Gm-Message-State: APjAAAVNRpRNbkWXLMAwQwZQOrDJX9r3w4hrV6SQLcjfDwYJMPbrrPsG
	WK/DHQtG9W8r2YEuIvEK5pG8F54mDTTTNIQqZrH67PA=
X-Google-Smtp-Source: APXvYqzMLz0oFYy87HRtkaUtBXmpLbn0/vdiPMEJbAW8lZalvZ1rMHKcnYFzA6SNVqXW4FYJnJo7VeDwkbxPSbEOg9M=
X-Received: by 2002:a5b:70b:: with SMTP id g11mr12904801ybq.468.1567211272719; 
	Fri, 30 Aug 2019 17:27:52 -0700 (PDT)
MIME-Version: 1.0
From: Turritopsis Dohrnii Teo En Ming <tdteoenming@gmail.com>
Date: Sat, 31 Aug 2019 08:27:39 +0800
Message-ID: <CANnei0HbqysOC-fDdcU8DRaL+QuKTXYyO6v3j+3UzqCNFfZvyw@mail.gmail.com>
To: dm-devel@redhat.com
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.66]);
	Sat, 31 Aug 2019 00:27:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]);
	Sat, 31 Aug 2019 00:27:53 +0000 (UTC) for IP:'209.85.219.169'
	DOMAIN:'mail-yb1-f169.google.com'
	HELO:'mail-yb1-f169.google.com' FROM:'tdteoenming@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.219.169 mail-yb1-f169.google.com 209.85.219.169
	mail-yb1-f169.google.com <tdteoenming@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.66
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Turritopsis Dohrnii Teo En Ming <tdteoenming@gmail.com>
Subject: [dm-devel] Singaporean Mr. Teo En Ming's Refugee Seeking Attempts,
 In Search of a Substantially Better Life
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]); Sat, 31 Aug 2019 00:30:12 +0000 (UTC)

Subject: Singaporean Mr. Teo En Ming's Refugee Seeking Attempts, In
Search of a Substantially Better Life

In reverse chronological order:

[1] Petition to the Government of Taiwan for Refugee Status, 5th
August 2019 Monday

Photo #1: At the building of the National Immigration Agency, Ministry
of the Interior, Taipei, Taiwan, 5th August 2019

Photo #2: Queue ticket no. 515 at the National Immigration Agency,
Ministry of the Interior, Taipei, Taiwan, 5th August 2019

Photo #3: Submission of documents/petition to the National Immigration
Agency, Ministry of the Interior, Taipei, Taiwan, 5th August 2019

Photos #4 and #5: Acknowledgement of Receipt (no. 03142) for the
submission of documents/petition from the National Immigration Agency,
Ministry of the Interior, Taipei, Taiwan, 5th August 2019, 10:00 AM

References:

(a) Petition to the Government of Taiwan for Refugee Status, 5th
August 2019 Monday (Blogspot blog)

Link: https://tdtemcerts.blogspot.sg/2019/08/petition-to-government-of-taiwan-for.html

(b) Petition to the Government of Taiwan for Refugee Status, 5th
August 2019 Monday (Wordpress blog)

Link: https://tdtemcerts.wordpress.com/2019/08/23/petition-to-the-government-of-taiwan-for-refugee-status/

[2] Application for Refugee Status at the United Nations Refugee
Agency, Bangkok, Thailand, 21st March 2017 Tuesday

References:

(a) [YOUTUBE] Vlog: The Road to Application for Refugee Status at the
United Nations High Commissioner for Refugees, Bangkok

Link: https://www.youtube.com/watch?v=utpuAa1eUNI

YouTube video Published on March 22nd, 2017

Views as at 31st August 2019: 593

YouTube Channel: Turritopsis Dohrnii Teo En Ming
Subscribers as at 31st August 2019: 2815
Link: https://www.youtube.com/channel/UC__F2hzlqNEEGx-IXxQi3hA




-----BEGIN EMAIL SIGNATURE-----

The Gospel for all Targeted Individuals (TIs):

[The New York Times] Microwave Weapons Are Prime Suspect in Ills of
U.S. Embassy Workers

Link: https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-microwave.html

********************************************************************************************

Singaporean Mr. Turritopsis Dohrnii Teo En Ming's Academic
Qualifications as at 14 Feb 2019

[1] https://tdtemcerts.wordpress.com/

[2] https://tdtemcerts.blogspot.sg/

[3] https://www.scribd.com/user/270125049/Teo-En-Ming

-----END EMAIL SIGNATURE-----

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
