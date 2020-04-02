Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 03F4819C593
	for <lists+dm-devel@lfdr.de>; Thu,  2 Apr 2020 17:10:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585840229;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aioN291T8i5FqXC1oS7/l77hiCpmoyfQNb5Lvd4gI5s=;
	b=aA7rfwHJW5Kv8l7eMYD8BoPxXTOUQvG3n6U+sWKjrCUibIazds7VDjPyEqNPDWBGFamNiT
	Pycctni4yL2PlFVqqZ1n8JSxputZupf400KrprP3QZ3xkQQ+Wxly5fLos6IW8JRT6Bw4mr
	EIQqMy7X610tB8isTCsSlostsVnY0nY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-2c5QDcl_NnuuVoRVY7qbrA-1; Thu, 02 Apr 2020 11:10:26 -0400
X-MC-Unique: 2c5QDcl_NnuuVoRVY7qbrA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4357413F6;
	Thu,  2 Apr 2020 15:10:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AC714D707;
	Thu,  2 Apr 2020 15:10:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 93E0B944DC;
	Thu,  2 Apr 2020 15:10:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 032F9xDN003235 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Apr 2020 11:09:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 88EF92018036; Thu,  2 Apr 2020 15:09:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8270F2028DCB
	for <dm-devel@redhat.com>; Thu,  2 Apr 2020 15:09:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4968F800297
	for <dm-devel@redhat.com>; Thu,  2 Apr 2020 15:09:57 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-502-dJonBxX5OAi7abCSXBH5TQ-1;
	Thu, 02 Apr 2020 11:09:55 -0400
X-MC-Unique: dJonBxX5OAi7abCSXBH5TQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 802C7AC2D;
	Thu,  2 Apr 2020 15:09:51 +0000 (UTC)
To: John Dorminy <jdorminy@redhat.com>, Bob Liu <bob.liu@oracle.com>
References: <20200327071459.67796-1-hare@suse.de>
	<20200327071459.67796-4-hare@suse.de>
	<93a26ed9-6f6e-2a4d-38d3-3fb76fa91e70@oracle.com>
	<CAMeeMh82FSZm4+i2+1f89P542=3HZR6S8--yP88ZiEjYSxUveA@mail.gmail.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <bbebc0d7-2d53-8412-81c2-d36842fc25e9@suse.de>
Date: Thu, 2 Apr 2020 17:09:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAMeeMh82FSZm4+i2+1f89P542=3HZR6S8--yP88ZiEjYSxUveA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 032F9xDN003235
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>,
	device-mapper development <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH 3/4] dm-zoned: V2 metadata handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNC8yLzIwIDQ6NTMgUE0sIEpvaG4gRG9ybWlueSB3cm90ZToKPiBJJ20gd29ycmllZCBhYm91
dCBoYXJkY29kaW5nIHV1aWQgbWVtYmVycyBhcyB1OFsxNl0uCj4gCj4gTWF5IEkgYXNrIHdoeSB5
b3UncmUgbm90IHVzaW5nIHV1aWRfdCB0byBkZWZpbmUgaXQgaW4gdGhlIG9uLWRpc2sgCj4gc3Ry
dWN0dXJlPyBJdCB3b3VsZCBzYXZlIHRoZSBjYXN0aW5nIG9mIHRoZSB1dWlkIG1lbWJlcnMgdG8g
KHV1aWRfdCAqKSAKPiBldmVyeSB0aW1lIHlvdSB1c2UgYSB1dWlkLmggZnVuY3Rpb24uCj4gCj4g
UG9zc2libHkgaXQgaXMgY3VzdG9tYXJ5IHRvIHVzZSBvbmx5IHJhdyBkYXRhdHlwZXMgb24gZGlz
ayByYXRoZXIgdGhhbiAKPiBvcGFxdWUgdHlwZXMgbGlrZSB1dWlkX3QsIEknbSBub3Qgc3VyZS4g
QnV0IGluIHRoYXQgY2FzZSwgcGVyaGFwcyB1c2luZyAKPiB0aGUgbmFtZWQgY29uc3RhbnQgVVVJ
RF9TSVpFIGluc3RlYWQgb2YgMTYgd291bGQgbWFrZSB0aGUgbWVhbmluZyBjbGVhcmVyPwo+IApJ
IHByZWZlciB0byB1c2UgYWJzb2x1dGUgdHlwZXMgKGxpa2UgX191OCkgd2hlbiBkZXNjcmliaW5n
IHRoZSBvbi1kaXNrIApmb3JtYXQuCldoZW4gdXNpbmcgb3BhcXVlIHR5cGVzIGxpa2UgdXVpZF90
IHRoZXJlIGFsd2F5cyBpcyB0aGUgcmlzayB0aGF0IHRoZSAKaW50ZXJuYWwgcmVwcmVzZW50YXRp
b24gd2lsbCBjaGFuZ2UsIGxlYWRpbmcgdG8gYW4gaW52b2x1bnRhcnkgY2hhbmdlIG9mIAp0aGUg
b24tZGlzayBmb3JtYXQgc3RydWN0dXJlIGFuZCBzdWJzZXF1ZW50IGNvbXBhYmlsaXR5IGlzc3Vl
cy4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgIFRl
YW1sZWFkIFN0b3JhZ2UgJiBOZXR3b3JraW5nCmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
bWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBOw7xybmJl
cmcpLCBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCgoKLS0KZG0tZGV2ZWwg
bWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

