Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5686816F
	for <lists+dm-devel@lfdr.de>; Mon, 15 Jul 2019 00:32:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 68004859FE;
	Sun, 14 Jul 2019 22:32:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA02B5C231;
	Sun, 14 Jul 2019 22:32:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB84B1806B11;
	Sun, 14 Jul 2019 22:32:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6EMWEMx014736 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 14 Jul 2019 18:32:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4E9755D968; Sun, 14 Jul 2019 22:32:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48DF45D9D6
	for <dm-devel@redhat.com>; Sun, 14 Jul 2019 22:32:12 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
	[209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7E1B58553A
	for <dm-devel@redhat.com>; Sun, 14 Jul 2019 22:32:11 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id e3so13603102edr.10
	for <dm-devel@redhat.com>; Sun, 14 Jul 2019 15:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=18F7S+sz1+w4DDLl7w+hOlbA2u+yT5KYKH/gptQ/VaQ=;
	b=imceNAxhLrDnzxWmSr7Jau5I3tU5+2KhbaWk1EDZXY4SPkAlPYOyyiTnF/3ujyEC1h
	TG2XwrGQrgEADGil33CTbY1HeIivatHOwyugVClltDMp+yoAqVIZ9ogmfO/2wIC7QwRg
	AbP4fgc142GMi6IteDUvf2cly7solWe2PkQn6nRfSpGE3KBEWdrhiYnCAll3TyeiGQSh
	TwC6sJLwzzBep1Hqvd0OMJYfWSlkB7ocx9gPGR6vtFCPxPhq6UZDskqsRXnUYDw8hwSQ
	Uog8NXiPMae8GYgmgZC0niXMvk/LBRIDKsIvmv5/EDPtY1d1wwz5ds2AhqsBaI2vI33/
	KZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=18F7S+sz1+w4DDLl7w+hOlbA2u+yT5KYKH/gptQ/VaQ=;
	b=SuhJ358Z+68+e0ykOSF7A9DBxxfaY7NCV6bHSzSw4zrPFK4OeBloU9JbFDCZIrXmhJ
	Fjcz3bW6WcqUfqUG6ECXk9SVPZq5+12wNWDQ3njZqIof6SXtcGQT4HQPsDQXQGd4STrK
	aA4trIi+wGEp+yQLoBSTfCgG64tsH7YT8Q9WsgK3t4XL2ou34xi8HUkbhWrhnj7F+4uV
	DqeWB+oeSzZNiABtOq8n/K/D+lUsbhkO1s30QXuCAw6GnK0lw3Geqg8t7i/CA1hSKIPP
	gJTFnWIHN3WOxbhwDOCE0BJQPeJj8Sz67I34d3Im7FTqnWKQnutA9cXuYl3Adb4u4Vy8
	aqCw==
X-Gm-Message-State: APjAAAVQTRiQIVNXCmVwvyfZHzEBG0hRj0SRNT1PwpGHKitEzzRAEN22
	mF1HWOR2kcdDyyomuof0+tNeNMUewXWre9fcfQJyoxFD
X-Google-Smtp-Source: APXvYqyjI7b6QJDyy3vcm7Urd3xhYLR69LFn32sAmXP8BGs8i3CoYKHOeNnHIPL2tUbycAIwvNe53KNcvM0UQwU4Dbk=
X-Received: by 2002:a05:6402:6d0:: with SMTP id
	n16mr19922451edy.168.1563143530094; 
	Sun, 14 Jul 2019 15:32:10 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?0JDQvdC00YDQtdC5INCR0L7RhdC+0L3QvtCy?=
	<bohonov.andrei@gmail.com>
Date: Mon, 15 Jul 2019 00:31:58 +0200
Message-ID: <CAPPgb08nfXLVmXapEbRtqaQBzDa26MeWJ=jRVLTnFmvr=tuWdg@mail.gmail.com>
To: dm-devel@redhat.com
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Sun, 14 Jul 2019 22:32:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Sun, 14 Jul 2019 22:32:11 +0000 (UTC) for IP:'209.85.208.44'
	DOMAIN:'mail-ed1-f44.google.com' HELO:'mail-ed1-f44.google.com'
	FROM:'bohonov.andrei@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.097  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, FROM_EXCESS_BASE64, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.208.44 mail-ed1-f44.google.com 209.85.208.44
	mail-ed1-f44.google.com <bohonov.andrei@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Subject: [dm-devel] (no subject)
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
Content-Type: multipart/mixed; boundary="===============5836601649769882256=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Sun, 14 Jul 2019 22:32:54 +0000 (UTC)

--===============5836601649769882256==
Content-Type: multipart/alternative; boundary="000000000000d8250a058dabb687"

--000000000000d8250a058dabb687
Content-Type: text/plain; charset="UTF-8"



--000000000000d8250a058dabb687
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">=C2=A0=C2=A0</div>

--000000000000d8250a058dabb687--


--===============5836601649769882256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============5836601649769882256==--

