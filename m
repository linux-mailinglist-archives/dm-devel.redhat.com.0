Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 745631D10C0
	for <lists+dm-devel@lfdr.de>; Wed, 13 May 2020 13:12:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589368349;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=f+HpcMMFCqJKPSY9xQWLgkz8JXiSTsEArHnZA7H8+G8=;
	b=PK2a/o2qo9FiBMpYrsGg/4e1/U61qSFiwXdCYG802llfknSnER5OMDCYI7wFE23MK714vW
	SHjjyiGm58J7IU8g1IOkvA0gDO9pceXsZFxSYm9NKpBfU1nJqUOaFA2gGilS38hNRxn2br
	Ba+JwA6Q8ltkzIsx56zYkLgIX1FsKUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-NgStcbqbMxGtxHUfr8p0wg-1; Wed, 13 May 2020 07:12:27 -0400
X-MC-Unique: NgStcbqbMxGtxHUfr8p0wg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AF6719200D1;
	Wed, 13 May 2020 11:12:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E447139E;
	Wed, 13 May 2020 11:12:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 00A284CA94;
	Wed, 13 May 2020 11:12:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04DBB3DD011956 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 07:11:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 27D252156A49; Wed, 13 May 2020 11:11:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23A882156A2D
	for <dm-devel@redhat.com>; Wed, 13 May 2020 11:10:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 170A0800294
	for <dm-devel@redhat.com>; Wed, 13 May 2020 11:10:59 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-311-WfHwcCImPne2OEs37ujudw-1;
	Wed, 13 May 2020 07:10:55 -0400
X-MC-Unique: WfHwcCImPne2OEs37ujudw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 0B0F1AF73;
	Wed, 13 May 2020 11:10:57 +0000 (UTC)
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Mike Snitzer <snitzer@redhat.com>
References: <20200513070843.71528-1-hare@suse.de>
	<BY5PR04MB6900AD28F5B6B6C3A8AEAA5EE7BF0@BY5PR04MB6900.namprd04.prod.outlook.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <5357d0d6-12cb-9585-36ae-9aec206eebb4@suse.de>
Date: Wed, 13 May 2020 13:10:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <BY5PR04MB6900AD28F5B6B6C3A8AEAA5EE7BF0@BY5PR04MB6900.namprd04.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04DBB3DD011956
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] device-mapper: use dynamic debug instead of
 compile-time config option
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNS8xMy8yMCAxMTo0MSBBTSwgRGFtaWVuIExlIE1vYWwgd3JvdGU6Cj4gT24gMjAyMC8wNS8x
MyAxNjoxMCwgSGFubmVzIFJlaW5lY2tlIHdyb3RlOgo+PiBTd2l0Y2ggdG8gdXNlIGR5bmFtaWMg
ZGVidWcgdG8gYXZvaWQgaGF2aW5nIHJlY29tcGlsZSB0aGUga2VybmVsCj4+IGp1c3QgdG8gZW5h
YmxlIGRlYnVnZ2luZyBtZXNzYWdlcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSGFubmVzIFJlaW5l
Y2tlIDxoYXJlQHN1c2UuZGU+Cj4+IC0tLQo+PiAgIGluY2x1ZGUvbGludXgvZGV2aWNlLW1hcHBl
ci5oIHwgNyArLS0tLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA2IGRl
bGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9kZXZpY2UtbWFwcGVy
LmggYi9pbmNsdWRlL2xpbnV4L2RldmljZS1tYXBwZXIuaAo+PiBpbmRleCBlMmQ1MDZkZDgwNWUu
LjNkNDM2NWZkMzAwMSAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9saW51eC9kZXZpY2UtbWFwcGVy
LmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC9kZXZpY2UtbWFwcGVyLmgKPj4gQEAgLTU1NiwxMyAr
NTU2LDggQEAgdm9pZCAqZG1fdmNhbGxvYyh1bnNpZ25lZCBsb25nIG5tZW1iLCB1bnNpZ25lZCBs
b25nIGVsZW1fc2l6ZSk7Cj4+ICAgI2RlZmluZSBETUlORk8oZm10LCAuLi4pIHByX2luZm8oRE1f
Rk1UKGZtdCksICMjX19WQV9BUkdTX18pCj4+ICAgI2RlZmluZSBETUlORk9fTElNSVQoZm10LCAu
Li4pIHByX2luZm9fcmF0ZWxpbWl0ZWQoRE1fRk1UKGZtdCksICMjX19WQV9BUkdTX18pCj4+ICAg
Cj4+IC0jaWZkZWYgQ09ORklHX0RNX0RFQlVHCj4gCj4gQ2FuIHdlIHJlbW92ZSB0aGlzIGZyb20g
S2NvbmZpZyBhcyBhIGNvbmZpZyBvcHRpb24gPwo+IApObywgd2UgY2FuJ3QsIGl0J3MgYmVpbmcg
dXNlZCBieSBkbS1zbmFwIGFuZCBkbS1pbnRlZ3JpdHkuCgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRy
LiBIYW5uZXMgUmVpbmVja2UgICAgICAgICAgICBUZWFtbGVhZCBTdG9yYWdlICYgTmV0d29ya2lu
ZwpoYXJlQHN1c2UuZGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKzQ5IDkxMSA3NDA1
MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21iSCwgTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKSwgR2VzY2jDpGZ0c2bDvGhyZXI6IEZl
bGl4IEltZW5kw7ZyZmZlcgoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRo
YXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

