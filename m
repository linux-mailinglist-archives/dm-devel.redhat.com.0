Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62424500332
	for <lists+dm-devel@lfdr.de>; Thu, 14 Apr 2022 02:48:43 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-V4esvDUnMIuTA_Bka4uUpQ-1; Wed, 13 Apr 2022 20:48:41 -0400
X-MC-Unique: V4esvDUnMIuTA_Bka4uUpQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C66F93811A2F;
	Thu, 14 Apr 2022 00:48:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD485C2812C;
	Thu, 14 Apr 2022 00:48:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 724421940373;
	Thu, 14 Apr 2022 00:48:38 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2CB271940345
 for <dm-devel@listman.corp.redhat.com>; Thu, 14 Apr 2022 00:48:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F1ADBC28109; Thu, 14 Apr 2022 00:48:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC525C27E9D
 for <dm-devel@redhat.com>; Thu, 14 Apr 2022 00:48:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCFB41C09044
 for <dm-devel@redhat.com>; Thu, 14 Apr 2022 00:48:36 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-do7_cO1vNR-2NYuSKX8hZw-1; Wed, 13 Apr 2022 20:48:33 -0400
X-MC-Unique: do7_cO1vNR-2NYuSKX8hZw-1
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23DJswvo008887; 
 Thu, 14 Apr 2022 00:48:23 GMT
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com with ESMTP id 3fb0x2kg1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Apr 2022 00:48:23 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23E0jjAi029530; Thu, 14 Apr 2022 00:48:22 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fb0k4j843-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Apr 2022 00:48:22 +0000
Received: from SJ0PR10MB4429.namprd10.prod.outlook.com (2603:10b6:a03:2d1::14)
 by PH0PR10MB4405.namprd10.prod.outlook.com (2603:10b6:510:40::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 14 Apr
 2022 00:48:16 +0000
Received: from SJ0PR10MB4429.namprd10.prod.outlook.com
 ([fe80::1c44:15ca:b5c2:603e]) by SJ0PR10MB4429.namprd10.prod.outlook.com
 ([fe80::1c44:15ca:b5c2:603e%8]) with mapi id 15.20.5144.029; Thu, 14 Apr 2022
 00:48:16 +0000
From: Jane Chu <jane.chu@oracle.com>
To: Dan Williams <dan.j.williams@intel.com>, Christoph Hellwig
 <hch@infradead.org>
Thread-Topic: [PATCH v7 4/6] dax: add DAX_RECOVERY flag and .recovery_write
 dev_pgmap_ops
Thread-Index: AQHYSSYdGKTdETDbkEmdZR/SZY7Ic6ziWZ4AgADMqgCAAMiFgIAHfkcAgAMzRYA=
Date: Thu, 14 Apr 2022 00:48:16 +0000
Message-ID: <847e8c8c-f1b0-66f5-f3e6-e2f6c618a80f@oracle.com>
References: <20220405194747.2386619-1-jane.chu@oracle.com>
 <20220405194747.2386619-5-jane.chu@oracle.com>
 <Yk0i/pODntZ7lbDo@infradead.org>
 <196d51a3-b3cc-02ae-0d7d-ee6fbb4d50e4@oracle.com>
 <Yk52415cnFa39qil@infradead.org>
 <CAPcyv4gfF4AhxD_vqCS9CTRraj8GAMDYQ7Zb411+FvxhF4ccOw@mail.gmail.com>
In-Reply-To: <CAPcyv4gfF4AhxD_vqCS9CTRraj8GAMDYQ7Zb411+FvxhF4ccOw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97b24623-b346-44f1-0d2e-08da1db07646
x-ms-traffictypediagnostic: PH0PR10MB4405:EE_
x-microsoft-antispam-prvs: <PH0PR10MB4405F19EDC15B9B9768E395DF3EF9@PH0PR10MB4405.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: xq7wqbKyEHG4q8Hwcd1ym+f3nnettoT1nW88LObICDIbKmQMmvyiVtPDpiO0sSfHMZp7o5TIh9SNLkV60Feq9GN0LPpnsLWJP6DlZl3dKcRlKG+o018qYgjo57ZzZjUlEwCQ/i0mDtNS+BgOSN4sfyMIJNcCgb5sdFHk/I2Hp22W7i08/ExSUAt9GBgSfnKy9IDhPlhCHvro/ppBl23GQ+107Glbz1ZvNgf/v4A/LJnVGzGPifqMkR1tI7F3sa4QJ/a4XMTUR+Vf5YzRsKOKV3r66fMuamxDsIRaxjk0vtgOSKrunjor19PwLvqxw4l5B0sBdpLC0zDJIbBtwF8WS0MmDoAOpuMTVDpPC5/KEZcMa+qgFj/6ldBtGXhmOLxqGcd1gSVuhxn1FFFidYIH6+EdKqtf0ZKaYgaxyPGTqxc2rzQaqlfjsF12+VsGpnuRGq2Vo/7KbG+/y5CWFJ4JNcoR6+5U0MhOF3ef+CMxMN9w1A9Uj+RNNhC3eOX2KblSQsWWT6GO3QdWmO1ank15A53D00+4l/hK45a2J7Yp9qPKiqAlopuuyPMclK2sShjXpk86KXLhYHm0fdfxJdker3cDs4T1ii5xmNX9/z5sex4Jx4XvPpvcnz+g0tcKYoeKuYxVb1fa2TCMP+NW688EBiqtN71+/raXcVrcUY9bNldGfDAn19lodSt5/hSNjZYp8Z/NqgpxgKdb5nd+sf9vUZZmd2kQ6uowPztIuEMY3DT3hqDBpnbXprNEF/UtyRjMIcYmlMC51eZwmrk7D9j+2aIAIkm4dTAVEpdbOV37H+E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4429.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(66476007)(316002)(110136005)(54906003)(508600001)(53546011)(8676002)(4326008)(44832011)(38070700005)(66946007)(122000001)(91956017)(76116006)(36756003)(31686004)(7416002)(38100700002)(64756008)(66556008)(6486002)(66446008)(83380400001)(71200400001)(5660300002)(26005)(6512007)(2616005)(186003)(86362001)(6506007)(31696002)(8936002)(142923001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dllCVGVMS05VdXM2UEhmZFJ2RVR6WUFTSDl0T0RnRXJlNUpOVCtLRkhqWlhM?=
 =?utf-8?B?Vmh4UmtmVE1hOTRJWFZiVUszNXRmc3lHM1E0d1N5Y2RvdDZsVXlnbVE5YjE2?=
 =?utf-8?B?VHhvR0FwWThMUys4QnVmVmdBaXJTSWQ0TUYwUTY4eVkxc1NXNVRoKzRDTUhw?=
 =?utf-8?B?UUxXbTRlOTVZeGpMUFJZMktnWmZ4aE9qZnpCek9BclZ1aUhPM1BpOU83cjVp?=
 =?utf-8?B?KzNzRktnQWgxTGh5ZWswdC9BSFJTS1VQSGVTZFIyc01kMTNqbkVtcHVEWk1l?=
 =?utf-8?B?cHV2bjBldHhjcTRxSlF1ajBaWERlUDFEQlBRbDlnT28wS2t4dkxlazhwWDJW?=
 =?utf-8?B?YnJVQXh3SFVxcHpIUC94V0o2cGVZNUo5MUZwcnhxbmw2TlpnQ2hEVEhvK1Nw?=
 =?utf-8?B?MjA3ckVDa09lKzF6MU9TN3BYSE9EZXpiKzRYNEhKTFhtbjZJaVhrWG52d3d2?=
 =?utf-8?B?YS9YTndMSERqVlEyVG95blRLQmMxM2ROdDdoS1ozY2xFa243MCswY2JjSVpW?=
 =?utf-8?B?K3ZhN3pXblhQUzRVRmdreG1sdnNHemllRlRKamZjWlE1TXBPQXc3VTFybjR1?=
 =?utf-8?B?MENsM2RrR1JoWm9EWk9wUjMxZTFnRklhb2crRW1KcjdadDl1Z2poWFRJY242?=
 =?utf-8?B?b0tRYk1mQVU2MVNkSzF2ZXhNcGNTVStMU3o2TmhlQVlXUUNlWVhXMXNXWmk4?=
 =?utf-8?B?MjdNd2pub0M0WHh4NzA3SitXWEppUUloK01XeUZOR09LV1hyYWwvb3huVk1Q?=
 =?utf-8?B?VW1nK0k1aEVKbWgzd204QisvM3BJOUVXVFVSZy9vV0UycGhLVzRYNjZlMjlP?=
 =?utf-8?B?MnFaWUNISEtkWjBsaUwyMzN0UVlKeHVmMEJkeGFjeVZrTHdZSTN6c1d3RlBI?=
 =?utf-8?B?MEU4OS9MRks5anhLY0FzNDhSdktzUk9sd3hDbXFISVQ2NEFQR3ZVVkpEK3hY?=
 =?utf-8?B?UUhUUjNvRitrVzFvWmJ0dWNEb296WFJ3UVpybEVYWXh5ZnlBckIycnZxMDdZ?=
 =?utf-8?B?cFpXeDhpWnA2bUU3Wm8wbVpkTWJLa1pXdk5pRFVyT1QyMm9scldqOUMrZWl1?=
 =?utf-8?B?WXpybzN0V3JZYXh5MlRTcVBIWWc2MzlCMVVoazd2QXFEUUxIbk00TENxVjBk?=
 =?utf-8?B?MXIvdHZZRnExMlkzWDJhdUs2MlRIS2R3OE9EYldBdXFzTnlSb3hjMDdNcEh5?=
 =?utf-8?B?WGtVUkc5YzVOMnFCeDdKb3FheG0rQnFLSGNMRWl6bmZLSGk1U21URU5UdlFx?=
 =?utf-8?B?MXY0UVFSdjdENE02RFdYdDR1VVZhZlJoTXZVeEt3VVV4VVZIcmhJaXIrclJp?=
 =?utf-8?B?Z1JneFpFV2pCdjFqZjltU2cyT01pQUthd3dqdUJ6SDlwak5tN0RSU3lLTDls?=
 =?utf-8?B?Q254amMwQ1NUam1iNmNJZ0pXQnNXdW5mYmV6N1ZPOVVVT2w1eFVsVGY1OC9B?=
 =?utf-8?B?UmdyMExhd3JCMWdmVTE1SGZwelpyRGRnR3MvZjRlSk1wNHcrdEVrKzJmU1JS?=
 =?utf-8?B?ZXFoV1N2NkszSVlvYmVRQThndUYza3pxUUFGRHQ4YkdTd1pGK0pBU1hjWVFG?=
 =?utf-8?B?Q1J2VEZDemVHWW1UbG16dTllOS9xY21WVmpQK2UwdFJDVjJxUzlMeTYySEE5?=
 =?utf-8?B?Q1Q5eU9LSkpMWXBaWUlGZ3VIZG9LaWg2Y0MvODFUT2Z6N2ZheWpSUDV6TUNJ?=
 =?utf-8?B?SjdWeWhaNlA0TW51WHJNQWY2enBXK2haaHpzd1VJcEhpNWxORTl0L3VYcnVR?=
 =?utf-8?B?cUtMNERNdjRQUEJvTzZ0SkRLUTNoUzFsTXl3WDNoV2dGaXYyMk1tSzhXbVNo?=
 =?utf-8?B?b1VEeC9FckZ3T1ljSzFhNnJTZzNYSmRkK0UzbW1oQ2E5TkQrVG1zemtobXhj?=
 =?utf-8?B?Z0E4OUFrcy9mblo5cU50U2VsT3NvbStmWVRGN29seXpGSi9VaG9veUc0ZEQr?=
 =?utf-8?B?RFRzck1JUVRIQzMrTkJibVZWRWJJSEdlU2Vkdkt4R3REWmo5UC8xQXdraThC?=
 =?utf-8?B?aE8vOWZNN1R4eFhhUWR5VUZFMmZ5RlhiNTlVN2JCVGJIZlY3RkZjR1F0U0Jo?=
 =?utf-8?B?aDFseUlhQWtCeU1oMTh1WnArVUVWWk1BZjFMdlc1TDlWWWl5akZWOEZxOGd2?=
 =?utf-8?B?OXVITDVZVGYrcWJMdGltTU40U3YzL0xKWSttY25LV3E5YmRjQStkaGFIZ0I1?=
 =?utf-8?B?bHFDYlBzUGRIb3FCajNlZzVZMWxDSHVzaDYzeFBCRmtuSy92VVBkdmRTeVBR?=
 =?utf-8?B?TzE4T0JrU1BvYTljd2dQOEtQVXhTdnJzZnZMRVdFZ3Jjb2ZWUTJhMWFwQUl6?=
 =?utf-8?B?Z1ZDSU40QVJwVkNoRWpxVFNMNEE0d05Uam5oODY4S2FSRVB4aGxmZz09?=
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4429.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b24623-b346-44f1-0d2e-08da1db07646
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 00:48:16.1161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eBaOIX5f9JskLikHE361+BGpqS/6pXMwrSiyqFtSopS9cf+vSOpGJg6gLAMonrtlrr7N5lTHGaZID6QAEaTo8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4405
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-13_04:2022-04-13,
 2022-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204140002
X-Proofpoint-ORIG-GUID: qKzhcPOl-uemzjO5tDvx3i60cLJkwczR
X-Proofpoint-GUID: qKzhcPOl-uemzjO5tDvx3i60cLJkwczR
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [dm-devel] [PATCH v7 4/6] dax: add DAX_RECOVERY flag and
 .recovery_write dev_pgmap_ops
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
Cc: "nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
 "dave.jiang@intel.com" <dave.jiang@intel.com>,
 "snitzer@redhat.com" <snitzer@redhat.com>,
 "djwong@kernel.org" <djwong@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
 "david@fromorbit.com" <david@fromorbit.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "willy@infradead.org" <willy@infradead.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "vgoyal@redhat.com" <vgoyal@redhat.com>,
 "vishal.l.verma@intel.com" <vishal.l.verma@intel.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "ira.weiny@intel.com" <ira.weiny@intel.com>, "agk@redhat.com" <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <46FB7D45E8232547ACBE1CBBA1D922A6@namprd10.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 4/11/2022 4:55 PM, Dan Williams wrote:
> On Wed, Apr 6, 2022 at 10:31 PM Christoph Hellwig <hch@infradead.org> wrote:
>>
>> On Wed, Apr 06, 2022 at 05:32:31PM +0000, Jane Chu wrote:
>>> Yes, I believe Dan was motivated by avoiding the dm dance as a result of
>>> adding .recovery_write to dax_operations.
>>>
>>> I understand your point about .recovery_write is device specific and
>>> thus not something appropriate for device agnostic ops.
>>>
>>> I can see 2 options so far -
>>>
>>> 1)  add .recovery_write to dax_operations and do the dm dance to hunt
>>> down to the base device that actually provides the recovery action
>>
>> That would be my preference.  But I'll wait for Dan to chime in.
> 
> Yeah, so the motivation was avoiding plumbing recovery through stacked
> lookups when the recovery is specific to a pfn and the provider of
> that pfn, but I also see it from Christoph's perspective that the only
> agent that cares about recovery is the fsdax I/O path. Certainly
> having ->dax_direct_access() take a DAX_RECOVERY flag and the op
> itself go through the pgmap is a confusing split that I did not
> anticipate when I made the suggestion. Since that flag must be there,
> then the ->recovery_write() should also stay relative to a dax device.
> 
> Apologies for the thrash Jane.
> 
> One ask though, please separate plumbing the new flag argument to
> ->dax_direct_access() and plumbing the new operation into preparation
> patches before filling them in with the new goodness.

Okay, will do in next revision.

thanks!
-jane
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

