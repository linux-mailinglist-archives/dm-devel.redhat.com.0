Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5A25EB18C
	for <lists+dm-devel@lfdr.de>; Mon, 26 Sep 2022 21:49:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664221750;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DqMvfCyXbirx2UzJBEY4mWrBwBbAH+vsjAg/EvKewj4=;
	b=BZBaxaI0E85RVmRUSkV5sPJ6EsEkrtk7xFO35DaF4uVllhslANhzWT76foQI3hrt8T/M9z
	kcILO+jnRe6fAWjGH5+EI/iH+nGktFdQAsQYz6gEOHyLEYI0OGQ3H4mQb7gOlfPHpbfpIP
	SR1PU+f3nM8r1yvL97iMSzBIsjoRojY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-aCdm-AgSOsqaTKoLAMDXXA-1; Mon, 26 Sep 2022 15:49:08 -0400
X-MC-Unique: aCdm-AgSOsqaTKoLAMDXXA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAF8885A5A6;
	Mon, 26 Sep 2022 19:49:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 791EF40C2065;
	Mon, 26 Sep 2022 19:49:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 186F41946A4E;
	Mon, 26 Sep 2022 19:48:59 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D003E1946586
 for <dm-devel@listman.corp.redhat.com>; Mon, 26 Sep 2022 19:48:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8A121C15BA8; Mon, 26 Sep 2022 19:48:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from segfault.boston.devel.redhat.com
 (segfault.boston.devel.redhat.com [10.19.60.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35E2EC15BA4;
 Mon, 26 Sep 2022 19:48:57 +0000 (UTC)
From: Jeff Moyer <jmoyer@redhat.com>
To: =?utf-8?Q?Yang=2C_Xiao=2F=E6=9D=A8_=E6=99=93?= <yangx.jy@fujitsu.com>
References: <e0cce6af-fd55-a582-194e-7f8a3aced6b0@fujitsu.com>
X-PGP-KeyID: 1F78E1B4
X-PGP-CertKey: F6FE 280D 8293 F72C 65FD  5A58 1FF8 A7CA 1F78 E1B4
Date: Mon, 26 Sep 2022 15:52:46 -0400
In-Reply-To: <e0cce6af-fd55-a582-194e-7f8a3aced6b0@fujitsu.com> (Xiao Yang's
 message of "Fri, 16 Sep 2022 14:56:37 +0800")
Message-ID: <x49y1u5lxpt.fsf@segfault.boston.devel.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [dm-devel] Question about which types of dm need to support DAX
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: toshi.kani@hpe.com, snitzer@redhat.com,
 Shiyang Ruan <ruansy.fnst@fujitsu.com>,
 "y-goto@fujitsu.com" <y-goto@fujitsu.com>, dm-devel@redhat.com,
 =?utf-8?B?R3UsIEppbnhpYW5nL+mhviDph5Hpppk=?= <gujx@fujitsu.com>,
 zwisler@kernel.org, agk@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

IllhbmcsIFhpYW8v5p2oIOaZkyIgPHlhbmd4Lmp5QGZ1aml0c3UuY29tPiB3cml0ZXM6Cgo+IEhp
IFJvc3MsIFRvc2hpLCBKZWZmIGFuZCBvdGhlcnMKPgo+IEFmdGVyIHJlYWRpbmcgdGhlIGtlcm5l
bCBwYXRjaGVzWzFdWzJdWzNdIGFib3V0IGRtLCBJIHRoaW5rIG9ubHkgdGhyZWUKPiB0eXBlcyhs
aW5lYXIsIHN0cmlwZSBhbmQgbG9nLXdyaXRlcykgb2YgZG0gY2FuIHN1cHBvcnQgREFYIG5vdywg
cmlnaHQ/CgpSaWdodC4KCj4gSSB3b25kZXIgd2h5IG9ubHkgdGhyZWUgdHlwZXMgb2YgZG0gbmVl
ZCB0byBzdXBwb3J0IERBWD8gSXMgdGhlcmUgYW55Cj4gcmVhc29uL2hpc3RvcnkgYW5kIHVzZSBj
YXNlPwoKSXQgd2FzIGVhc3kgdG8gYWRkIERBWCBzdXBwb3J0IHRvIHRob3NlIHRhcmdldHMuICBO
b3RlIHRoYXQgaWYgYSB0YXJnZXQKbmVlZHMgdG8gaW50ZXJjZXB0IEkvTywgdGhlbiBpdCBpcyBm
dW5kYW1lbnRhbGx5IGluY29tcGF0aWJsZSB3aXRoIERBWC4KCkNoZWVycywKSmVmZgotLQpkbS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVk
aGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVsCg==

