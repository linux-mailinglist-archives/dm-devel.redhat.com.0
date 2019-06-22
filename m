Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEB6503EE
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 09:44:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E45FC80F79;
	Mon, 24 Jun 2019 07:44:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8A0719936;
	Mon, 24 Jun 2019 07:44:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 355771806B1B;
	Mon, 24 Jun 2019 07:44:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5M651m7028472 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 22 Jun 2019 02:05:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 81A9D600C4; Sat, 22 Jun 2019 06:05:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4241360572;
	Sat, 22 Jun 2019 06:04:57 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 768EE308338F;
	Sat, 22 Jun 2019 06:04:48 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id z75so1756151pgz.5;
	Fri, 21 Jun 2019 23:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=yg/1WkKqkNqxYmfahwU10rIwyumik9JOh8CghNFdi84=;
	b=nRp0PQRyhWjbC0KEWHP9ZlUeueQiT/aMpAdU278WcErKsKci2cmQ33E+yrQ2by+tHI
	eE9fbpXci/gaqu9Dsq7+cF7RnqeWWVhMX4uMNhMYY5AweDkxpgNAfXMJF6Ag9Bz6akXu
	OcoYOfafP/zdBotqhZQq35Q62vTQHJ7pv6xsDhC387Q73ETAb383VPMITI7f+IIu+u3P
	lAnEKUgq0Tvz7Hr16ohwQOG79Um6rN46EK8GY2b7eWy0gcVP//MhfUFKoIKPTrE3hpZG
	RNft5hpW4DTdirxzcq9BcgJsQxpREgMaFknx3H08PSgYnPfWc1R9cS3oAO8U9iN/sFBW
	iIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=yg/1WkKqkNqxYmfahwU10rIwyumik9JOh8CghNFdi84=;
	b=WtD4Hz7kiXclrwPorqDVKr6znld24BrdGgMLqg7k6mMkQbdDvSTmT+r9jg85H3NKsW
	b0Tjl1lcOTAC4ZtQPvIZZZe1aBEDy4XTZ/TuEIeK5oZexnUZEeJqGRFh34TrsJlvxlLo
	6bBl6SCgA5FyusSNDqvCpNyuOkYvhe5GJDtqKLpW7a/94LfPOc1BZfQ3ULMd2Xnjthwq
	4w6v9qRhu4ZXGUvpLG7rxuKEu6tukdFZ/nuUAXhJMto029mGp8j6S/GGJaPLnetnsDAD
	h5oGsV7WVgwmdWclRRWxJC9cjJ9JN3t3R5E+O4t6d4phSDg+j//LbwGO3cJtwYEMuZgB
	fJZA==
X-Gm-Message-State: APjAAAW4ZLvA/wn3l/FAjCNVX+Sz+8Tx4CsdCMhXRQjIXQwl/jPkBhRM
	07BwJZru9vPZ5TCiU5tMVOM=
X-Google-Smtp-Source: APXvYqwiVKfl8+/c+x6CKHQKpg0wtswg8LUQht15uRDFbh8EiZhYe9L23duyQegRi9Vl4R7neMHrsw==
X-Received: by 2002:a63:5a1f:: with SMTP id o31mr21859229pgb.254.1561183487696;
	Fri, 21 Jun 2019 23:04:47 -0700 (PDT)
Received: from localhost ([123.213.206.190])
	by smtp.gmail.com with ESMTPSA id w7sm954242pfb.117.2019.06.21.23.04.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 21 Jun 2019 23:04:46 -0700 (PDT)
Date: Sat, 22 Jun 2019 15:04:44 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Matias =?utf-8?B?QmrDuHJsaW5n?= <mb@lightnvm.io>
Message-ID: <20190622060444.GA6975@minwooim-desktop>
References: <20190621130711.21986-1-mb@lightnvm.io>
	<20190621130711.21986-2-mb@lightnvm.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190621130711.21986-2-mb@lightnvm.io>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Sat, 22 Jun 2019 06:04:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Sat, 22 Jun 2019 06:04:48 +0000 (UTC) for IP:'209.85.215.196'
	DOMAIN:'mail-pg1-f196.google.com'
	HELO:'mail-pg1-f196.google.com' FROM:'minwoo.im.dev@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: -0.107  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.215.196 mail-pg1-f196.google.com 209.85.215.196
	mail-pg1-f196.google.com <minwoo.im.dev@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 24 Jun 2019 03:43:21 -0400
Cc: James.Bottomley@HansenPartnership.com, damien.lemoal@wdc.com,
	ajay.joshi@wdc.com, martin.petersen@oracle.com,
	chaitanya.kulkarni@wdc.com, dmitry.fomichev@wdc.com,
	snitzer@redhat.com, aravind.ramesh@wdc.com,
	linux-kernel@vger.kernel.org, axboe@fb.com, dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	Matias =?utf-8?B?QmrDuHJsaW5n?= <matias.bjorling@wdc.com>,
	linux-scsi@vger.kernel.org, hch@lst.de, agk@redhat.com
Subject: Re: [dm-devel] [PATCH 1/4] block: add zone open,
	close and finish support
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Mon, 24 Jun 2019 07:44:24 +0000 (UTC)

T24gMTktMDYtMjEgMTU6MDc6MDgsIE1hdGlhcyBCasO4cmxpbmcgd3JvdGU6Cj4gQEAgLTIyNiw2
ICsyMjgsOSBAQCBpbnQgYmxrZGV2X3Jlc2V0X3pvbmVzKHN0cnVjdCBibG9ja19kZXZpY2UgKmJk
ZXYsCj4gIAlpZiAoIWJsa19xdWV1ZV9pc196b25lZChxKSkKPiAgCQlyZXR1cm4gLUVPUE5PVFNV
UFA7Cj4gIAo+ICsJaWYgKCFvcF9pc196b25lX21nbXRfb3Aob3ApKQo+ICsJCXJldHVybiAtRU9Q
Tk9UU1VQUDsKPiArCgpuaXRwaWNrOiAtRUlOVkFMIGxvb2tzIGJldHRlciB0byByZXR1cm4gYXMg
RGFtaWVuIHBvaW50ZWQgb3V0LgoKT3RoZXJ3aXNlIGl0IGxvb2tzIGdvb2QgdG8gbWU6CgpSZXZp
ZXdlZC1ieTogTWlud29vIEltIDxtaW53b28uaW0uZGV2QGdtYWlsLmNvbT4KCi0tCmRtLWRldmVs
IG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20v
bWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==
