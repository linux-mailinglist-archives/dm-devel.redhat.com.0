Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 627FC1A9467
	for <lists+dm-devel@lfdr.de>; Wed, 15 Apr 2020 09:39:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586936392;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7TD7bU1IyUSfCPvMGsNlWiVaz/IwKgCPnK76r62yMcY=;
	b=HylsmrTdj6QDQE5d7eKF+qv1tCB8fj0fjz1M0sbkYPz30ijR0eQioMmAmWp0bw4b7Zo2Nr
	1AnBiFWKE0rtMJnNhY315UnVjVajT+HfLp/V8jIzDPJnYrYwjwh4rM96PRPQJZoXlVan6p
	DaPmE24PUV19SJIciEzSTj1u9+53y6I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-uiRQB8wFMvmVgzWVPj-ULQ-1; Wed, 15 Apr 2020 03:39:48 -0400
X-MC-Unique: uiRQB8wFMvmVgzWVPj-ULQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C67311137840;
	Wed, 15 Apr 2020 07:39:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77A585D9E2;
	Wed, 15 Apr 2020 07:39:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B0D118089CD;
	Wed, 15 Apr 2020 07:39:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03F07dDX014778 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 20:07:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2FD692093CF3; Wed, 15 Apr 2020 00:07:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B9222028CD5
	for <dm-devel@redhat.com>; Wed, 15 Apr 2020 00:07:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 527FE101A55D
	for <dm-devel@redhat.com>; Wed, 15 Apr 2020 00:07:37 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-360-oxunBgV1MdGEmNl7kdVhgQ-1; Tue, 14 Apr 2020 20:07:32 -0400
X-MC-Unique: oxunBgV1MdGEmNl7kdVhgQ-1
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	03F02gZ0153441; Wed, 15 Apr 2020 00:07:31 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2130.oracle.com with ESMTP id 30dn9cgdxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Apr 2020 00:07:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	03F021I6031877; Wed, 15 Apr 2020 00:07:30 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3020.oracle.com with ESMTP id 30dn99tmex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Apr 2020 00:07:30 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03F07Tti013160;
	Wed, 15 Apr 2020 00:07:29 GMT
Received: from [192.168.1.14] (/114.88.246.185)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 14 Apr 2020 17:07:29 -0700
To: Mike Snitzer <snitzer@redhat.com>
References: <20200409064527.82992-1-hare@suse.de>
	<4052464c-cf93-3e22-3050-58183b9ae564@oracle.com>
	<72e25c3e-818b-93a3-1468-5a5fcd256469@suse.de>
	<20200414151342.GA24238@redhat.com>
From: Bob Liu <bob.liu@oracle.com>
Message-ID: <f0a51abf-0e14-e64b-e5c3-2b07cae7a662@oracle.com>
Date: Wed, 15 Apr 2020 08:07:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200414151342.GA24238@redhat.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9591
	signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
	mlxscore=0 adultscore=0
	spamscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2004140173
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9591
	signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
	adultscore=0
	lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
	priorityscore=1501 spamscore=0 suspectscore=0 mlxscore=0
	mlxlogscore=999
	clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2004140173
X-MIME-Autoconverted: from 8bit to quoted-printable by userp2130.oracle.com id
	03F02gZ0153441
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03F07dDX014778
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 15 Apr 2020 03:38:55 -0400
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCHv3 00/11] dm-zoned: metadata version 2
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gNC8xNC8yMCAxMToxMyBQTSwgTWlrZSBTbml0emVyIHdyb3RlOgo+IE9uIFR1ZSwgQXByIDE0
IDIwMjAgYXQgIDI6MzhhbSAtMDQwMCwKPiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5kZT4g
d3JvdGU6Cj4gCj4+IE9uIDQvMTEvMjAgMjozMCBQTSwgQm9iIExpdSB3cm90ZToKPj4+IE9uIDQv
OS8yMCAyOjQ1IFBNLCBIYW5uZXMgUmVpbmVja2Ugd3JvdGU6Cj4+Pj4gSGkgYWxsLAo+Pj4+Cj4+
Pj4gdGhpcyBwYXRjaHNldCBhZGRzIGEgbmV3IG1ldGFkYXRhIHZlcnNpb24gMiwgd2hpY2ggYnJp
bmdzIHRoZSBmb2xsb3dpbmcKPj4+PiBpbXByb3ZlbWVudHM6Cj4+Pj4gLSBVVUlEcyBhbmQgbGFi
ZWxzOiBBZGRpbmcgdGhyZWUgbW9yZSBmaWVsZHMgdG8gdGhlIG1ldGFkYXRhIGNvbnRhaW5pbmcK
Pj4+PiAgIHRoZSBkbS16b25lZCBkZXZpY2UgVVVJRCBhbmQgbGFiZWwsIGFuZCB0aGUgZGV2aWNl
IFVVSUQuIFRoaXMgYWxsb3dzCj4+Pj4gICBmb3IgYW4gdW5pcXVlIGlkZW50aWZpY2F0aW9uIG9m
IHRoZSBkZXZpY2VzLCBzbyB0aGF0IHNldmVyYWwgZG0tem9uZWQKPj4+PiAgIHNldHMgY2FuIGNv
ZXhpc3QgYW5kIGhhdmUgYSBwZXJzaXN0ZW50IGlkZW50aWZpY2F0aW9uLgo+Pj4+IC0gRXh0ZW5k
IHJhbmRvbSB6b25lcyBieSBhbiBhZGRpdGlvbmFsIHJlZ3VsYXIgZGlzayBkZXZpY2U6IEEgcmVn
dWxhcgo+Pj4+ICAgYmxvY2sgZGV2aWNlIGNhbiBiZSBhZGRlZCB0b2dldGhlciB3aXRoIHRoZSB6
b25lZCBibG9jayBkZXZpY2UsIHByb3ZpZGluZwo+Pj4+ICAgYWRkaXRpb25hbCAoZW11bGF0ZWQp
IHJhbmRvbSB3cml0ZSB6b25lcy4gV2l0aCB0aGlzIGl0J3MgcG9zc2libGUgdG8KPj4+PiAgIGhh
bmRsZSBzZXF1ZW50aWFsIHpvbmVzIG9ubHkgZGV2aWNlczsgYWxzbyB0aGVyZSB3aWxsIGJlIGEg
c3BlZWQtdXAgaWYKPj4+PiAgIHRoZSByZWd1bGFyIGJsb2NrIGRldmljZSByZXNpZGVzIG9uIGEg
ZmFzdCBtZWRpdW0uIFRoZSByZWd1bGFyIGJsb2NrIGRldmljZQo+Pj4+ICAgaXMgcGxhY2VkIGxv
Z2ljYWxseSBpbiBmcm9udCBvZiB0aGUgem9uZWQgYmxvY2sgZGV2aWNlLCBzbyB0aGF0IG1ldGFk
YXRhCj4+Pj4gICBhbmQgbWFwcGluZyB0YWJsZXMgcmVzaWRlIG9uIHRoZSByZWd1bGFyIGJsb2Nr
IGRldmljZSwgbm90IHRoZSB6b25lZCBkZXZpY2UuCj4+Pj4gLSBUZXJ0aWFyeSBzdXBlcmJsb2Nr
IHN1cHBvcnQ6IEluIGFkZGl0aW9uIHRvIHRoZSB0d28gZXhpc3Rpbmcgc2V0cyBvZiBtZXRhZGF0
YQo+Pj4+ICAgYW5vdGhlciwgdGVydGlhcnksIHN1cGVyYmxvY2sgaXMgd3JpdHRlbiB0byB0aGUg
Zmlyc3QgYmxvY2sgb2YgdGhlIHpvbmVkCj4+Pj4gICBibG9jayBkZXZpY2UuIFRoaXMgc3VwZXJi
bG9jayBpcyBmb3IgaWRlbnRpZmljYXRpb24gb25seTsgdGhlIGdlbmVyYXRpb24KPj4+PiAgIG51
bWJlciBpcyBzZXQgdG8gJzAnIGFuZCB0aGUgYmxvY2sgaXRzZWxmIGl0IG5ldmVyIHVwZGF0ZWQu
IFRoZSBhZGRpdGlvbmFsCj4+Pj4gICBtZXRhZGF0ZSBsaWtlIGJpdG1hcCB0YWJsZXMgZXRjIGFy
ZSBub3QgY29waWVkLgo+Pj4+Cj4+Pj4gVG8gaGFuZGxlIHRoaXMsIHNvbWUgY2hhbmdlcyB0byB0
aGUgb3JpZ2luYWwgaGFuZGxpbmcgYXJlIGludHJvZHVjZWQ6Cj4+Pj4gLSBab25lcyBhcmUgbm93
IGVxdWlkaXN0YW50LiBPcmlnaW5hbGx5LCBydW50IHpvbmVzIHdlcmUgaWdub3JlZCwgYW5kCj4+
Pj4gICBub3QgY291bnRlZCB3aGVuIHNpemluZyB0aGUgbWFwcGluZyB0YWJsZXMuIFdpdGggdGhl
IGR1YWwgZGV2aWNlIHNldHVwCj4+Pj4gICBydW50IHpvbmVzIG1pZ2h0IG9jY3VyIGF0IHRoZSBl
bmQgb2YgdGhlIHJlZ3VsYXIgYmxvY2sgZGV2aWNlLCBtYWtpbmcKPj4+PiAgIGRpcmVjdCB0cmFu
c2xhdGlvbiBiZXR3ZWVuIHpvbmUgbnVtYmVyIGFuZCBzZWN0b3IvYmxvY2sgbnVtYmVyIGNvbXBs
ZXguCj4+Pj4gICBGb3IgbWV0YWRhdGEgdmVyc2lvbiAyIGFsbCB6b25lcyBhcmUgY29uc2lkZXJl
ZCB0byBiZSBvZiB0aGUgc2FtZSBzaXplLAo+Pj4+ICAgYW5kIHJ1bnQgem9uZXMgYXJlIHNpbXBs
eSBtYXJrZWQgYXMgJ29mZmxpbmUnIHRvIGhhdmUgdGhlbSBpZ25vcmVkIHdoZW4KPj4+PiAgIGFs
bG9jYXRpbmcgYSBuZXcgem9uZS4KPj4+PiAtIFRoZSBibG9jayBudW1iZXIgaW4gdGhlIHN1cGVy
YmxvY2sgaXMgbm93IHRoZSBnbG9iYWwgbnVtYmVyLCBhbmQgcmVmZXJzIHRvCj4+Pj4gICB0aGUg
bG9jYXRpb24gb2YgdGhlIHN1cGVyYmxvY2sgcmVsYXRpdmUgdG8gdGhlIHJlc3VsdGluZyBkZXZp
Y2UtbWFwcGVyCj4+Pj4gICBkZXZpY2UuIFdoaWNoIG1lYW5zIHRoYXQgdGhlIHRlcnRpYXJ5IHN1
cGVyYmxvY2sgY29udGFpbnMgYWJzb2x1dGUgYmxvY2sKPj4+PiAgIGFkZHJlc3Nlcywgd2hpY2gg
bmVlZHMgdG8gYmUgdHJhbnNsYXRlZCB0byB0aGUgcmVsYXRpdmUgZGV2aWNlIGFkZHJlc3Nlcwo+
Pj4+ICAgdG8gZmluZCB0aGUgcmVmZXJlbmNlZCBibG9jay4KPj4+Pgo+Pj4+IFRoZXJlIGlzIGFu
IGFjY29tcGFueWluZyBwYXRjaHNldCBmb3IgZG0tem9uZWQtdG9vbHMgZm9yIHdyaXRpbmcgYW5k
IGNoZWNraW5nCj4+Pj4gdGhpcyBuZXcgbWV0YWRhdGEuCj4+Pj4KPj4+PiBBcyB1c3VhbCwgY29t
bWVudHMgYW5kIHJldmlld3MgYXJlIHdlbGNvbWUuCj4+Pj4KPj4+PiBDaGFuZ2VzIHRvIHYyOgo+
Pj4+IC0gS2lsbCBkbXpfaWQoKQo+Pj4+IC0gSW5jbHVkZSByZXZpZXdzIGZyb20gRGFtaWVuCj4+
Pj4gLSBTYW5pdGl6ZSB1dWlkIGhhbmRsaW5nIGFzIHN1Z2dlc3RlZCBieSBKb2huIERvcm1pbnkK
Pj4+Pgo+Pj4KPj4+IFRoaXMgc2VyaWVzIGxvb2tzIGdvb2QgdG8gbWUsIGZlZWwgZnJlZSB0byBh
ZGQgbXkKPj4+IFJldmlld2VkLWJ5OiBCb2IgTGl1IDxib2IubGl1QG9yYWNsZS5jb20+Cj4+Pgo+
Pj4gQnkgdGhlIHdheSwgaGF2ZSB5b3UgY29tcGxldGVkIHRoZSBwYXRjaGVzIGZvciByZWd1bGFy
IGRldmljZSBzdXBwb3J0Pwo+Pj4gSSB3YXMgY29uc2lkZXJpbmcgcmViYXNlIG15IHByZXZpb3Vz
IHBhdGNoZXMgdG8gdGhpcyBzZXJpZXMgYnV0IG5vdCBzdXJlIGlzIGl0IHN0aWxsIG5lY2Vzc2Fy
eS4KPiAKPiBCb2IsIG5vdCB0cnlpbmcgdG8gYmUgb3Zlcmx5IGNyaXRpY2FsIGJ1dCBpZiB5b3Ug
Y291bGRuJ3QgYW5zd2VyIHlvdXIKClRoZXNlIHBhdGNoZXMgZGlkIGxvb2tzIGZpbmUgdG8gbWUs
IG15IHF1ZXN0aW9uIHdhcyBhc2tpbmcgYWJvdXQgZm9sbG93aW5nIHJlZ3VsYXItZGV2aWNlIHN1
cHBvcnQKcGF0Y2hlcyB3aGljaCBoYXZlbid0IGluY2x1ZGVkIGluIHRoaXMgc2VyaWVzLgpBbnl3
YXksIEkgd2lsbCBwYXkgbW9yZSBhdHRlbnRpb24uClRoYW5rcyBmb3IgcmVtaW5kaW5nLgoKQm9i
Cgo+IHF1ZXN0aW9uIGhvdyBkaWQgeW91IGZlZWwgY29tZm9ydGFibGUgcHJvdmlkaW5nIHlvdXIg
UmV2aWV3ZWQtYnkgdG8gdGhpcwo+IHBhdGNoc2V0PyAgVGhhdCBSZXZpZXdlZC1ieSBfbXVzdF8g
bWVhbiBzb21ldGhpbmcuCj4gCj4gTWlrZQo+IAo+IAo+PiBJIGhhdmUgY29tYmluZWQgYm90aCBw
YXRjaHNldHMsIHRoaXMgb25lIG5vdyBhbHNvIGluY2x1ZGVkIHJlZ3VsYXIKPj4gZGV2aWNlIHN1
cHBvcnQuIFNvIG5vIG5lZWQgdG8gcmVzZW5kIGZyb20geW91ciBzaWRlLgo+Pgo+PiBDaGVlcnMs
Cj4+Cj4+IEhhbm5lcwo+PiAtLSAKPj4gRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgIFRl
YW1sZWFkIFN0b3JhZ2UgJiBOZXR3b3JraW5nCj4+IGhhcmVAc3VzZS5kZSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OAo+PiBTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcKPj4gSFJCIDM2ODA5IChB
RyBOw7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCj4+Cj4g
CgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93
d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

